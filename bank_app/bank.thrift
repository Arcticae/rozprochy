typedef i64 Money
typedef i64 ID
typedef string Key

#Enums
enum Membership {
    STANDARD = 0,
    PREMIUM = 1
}

#Structs
struct BankClient {
    1: ID id,
    2: Membership membership,
    3: Money balance
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
    BankClient create_account(1: string pesel, 2: Money balance);
}

service StandardClient {
    Money get_balance(1: ID id, 2: Key key) throws (1: InvalidOperation op);
    TransactionResponse put_money(1: Key key, 2: ID id, 3: Money amount ) throws (1: InvalidOperation op );
    TransactionResponse get_money(1: Key key, 2: ID id, 3: Money amount ) throws (1: InvalidOperation op );
    void put_client(1: BankClient client);
    bool exists(1: ID id)
}

service PremiumClient extends StandardClient {
    TransactionResponse request_loan(1: ID id, 2: Key key, 3: Money amount);
}