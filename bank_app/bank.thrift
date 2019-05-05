namespace java bank_thrift
typedef i64 Money
typedef i64 ID
typedef string Key
#Enums
enum Membership {
    STANDARD = 0,
    PREMIUM = 1
}
enum Currency {
    USD = 0,
    PLN = 1,
    EUR = 2,
    GBP = 3,
    CHF = 4,
}


#Structs
struct BankClient {
    1: ID id,
    2: Membership membership,
    3: Money income,
    4: Currency currency,
	5: Key key,
}

struct LoanParams {
    1: Money money,
    2: i32 months,
    3: Currency currency
}

struct TransactionResponse {
    1: bool accepted,
    2: optional string reason
}

#Exceptions
exception InvalidOperation {
    1: string why,
    2: i32 arg_number
}

#Services
service AccountCreator {
    BankClient create_account(1: required ID id, 2: required Money monthly_income, 3: Currency currency) throws (1: InvalidOperation op);
}

service StandardClient {
    Money get_balance(1: ID id, 2: Key key) throws (1: InvalidOperation op);
    TransactionResponse put_money(1: Key key, 2: ID id, 3: Money amount ) throws (1: InvalidOperation op );
    TransactionResponse get_money(1: Key key, 2: ID id, 3: Money amount ) throws (1: InvalidOperation op );
    void put_client(1: BankClient client);
    bool exists(1: ID id)
}

service PremiumClient extends StandardClient {
    TransactionResponse request_loan(1: ID id, 2: Key key, 3: LoanParams loan_params);
}