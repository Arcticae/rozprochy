import sys
from thrift import Thrift

sys.path.append('gen-py')
from bank import AccountCreator
from bank import StandardClient
from bank import PremiumClient
from bank.ttypes import InvalidOperation, Currency, Membership, LoanParams

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TMultiplexedProtocol, TBinaryProtocol


def services():

    cls_transport = TTransport.TBufferedTransport(TSocket.TSocket('localhost', 2020))
    acc_transport = TTransport.TBufferedTransport(TSocket.TSocket('localhost', 9090))

    std_cls_proto = TMultiplexedProtocol.TMultiplexedProtocol(TBinaryProtocol.TBinaryProtocol(cls_transport), "STD_CLS")
    prm_cls_proto = TMultiplexedProtocol.TMultiplexedProtocol(TBinaryProtocol.TBinaryProtocol(cls_transport), "PRM_CLS")
    acc_crs_proto = TBinaryProtocol.TBinaryProtocol(acc_transport)

    std_cls = StandardClient.Client(std_cls_proto)
    prm_cls = PremiumClient.Client(prm_cls_proto)
    acc_crs = AccountCreator.Client(acc_crs_proto)

    cls_transport.open()
    acc_transport.open()

    return std_cls, prm_cls, acc_crs

currencies = {
    0: Currency.USD,
    1: Currency.PLN,
    2: Currency.EUR,
    3: Currency.GBP,
    4: Currency.CHF
}


def create_account(acc_crs_client):
    try:
        id = int(input("Enter a number which will be your ID number in bank\n"))
        income = int(input("Enter a number which will be your income \n"))
        currency = currencies[int(input("Which currency you want as your native currency? \n" +
                                        "0: USD\n1: PLN\n2: EUR\n3: GBP\n4: CHF\n"))]

        clnt = acc_crs_client.create_account(id, income, currency)
        print("Creating account went succesfully, you have been logged in automatically\n")
        id = clnt.id
        key = clnt.key
        print("ID: " + str(id) + " Key: " + key)
        print("You are a" + (" premium" if clnt.membership == 1 else " standard") + " user")
        return id, key, clnt.membership
    except InvalidOperation as oops:
        print(oops.why)
        return None


def balance(std, prm, membership, id, key):
    if membership is None:
        print("Log in first or create an account")
        return
    elif membership is Membership.STANDARD:
        print("You are a standard member")
        handler = std
    elif membership is Membership.PREMIUM:
        print("You are a premium member")
        handler = prm
    else:
        print("Unrecognised type of membership.")
        return
    try:
        print("Getting balance...")
        bal = handler.get_balance(id, key)
        print("Your current income is: " + str(bal))
    except InvalidOperation as oops:
        print("Operation failed. Reason: " + oops.why)


def request_loan(prm, membership, id, key):
    if membership is not Membership.PREMIUM:
        print("You are not allowed to do this with standard account")
        return

    moneys = int(input("Give me a number of moneys you want to loan"))
    months = int(input("Give me a number of months you want teh loan for"))
    currency = currencies[int(input("Which currency you want as loan currency? \n" +
                                    "0: USD\
                                     1: PLN\
                                     2: EUR\
                                     3: GBP\
                                     4: CHF"))]

    params = LoanParams(moneys, months, currency)
    response = prm.request_loan(id, key, params)
    if response.accepted:
        print("Your loan has been accepted.")
    else:
        print("Your loan request has been rejected. Reason: \n " + response.reason)


def log_in():
    id = int(input("Login:"))
    key = input("Key:")
    membership = {0: Membership.STANDARD, 1: Membership.PREMIUM}[int(input("Membership: \n\t0 = Standard ,\n\t 1 = Premium\n"))]
    return id, key, membership


def main():
    id = None
    key = None
    membership = None

    std, prm, acc = services()
    valid_commands = ['create_acc', 'req_loan', 'get_balance', 'put_money', 'get_money', 'request_loan', 'log_in']
    print("List of valid commands: \n" + str(valid_commands))

    while True:
        command = input("Give a valid command from the list\n")

        if command == 'create_acc':
            id, key, membership = create_account(acc)
        elif command == 'req_loan':
            request_loan(prm, membership, id, key)
        elif command == 'get_balance':
            balance(std, prm, membership, id, key)
        elif command == 'put_money':
            print("NOT IMPLEMENTED")
        elif command == 'get_money':
            print("NOT IMPLEMENTED")
        elif command == 'request_loan':
            request_loan(prm, membership, id, key)
        elif command == 'log_in':
            id, key, membership = log_in()
        else:
            print("Unrecognised command \n Valid commands: \n " + str(valid_commands))


main()
