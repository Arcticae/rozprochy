cwd = File.dirname(__FILE__)
$LOAD_PATH << File.join(cwd, '..', '..', 'gen-rb')
require 'account_creator'
require 'bank_types'
require 'standard_client'
require 'premium_client'


class AccountCreatorHandler
  def initialize
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', 8080))
    protocol = Thrift::BinaryProtocol.new(transport)
    @prm_cls_srv = PremiumClient::Client.new(protocol)
    @std_cls_srv = StandardClient::Client.new(protocol)
    transport.open
  end

  def create_account(pesel, balance)
    #Raise invalid balance
    if balance < 0
      x = InvalidOperation.new
      x.why = 'Balance cannot be less than 0'
      x.arg_number = 2
      raise x
    end

    acc = BankClient.new
    # TODO: for now memberships are determined by balance and pesel is not validated
    acc.membership = balance > 1000 ? Membership::PREMIUM : Membership::STANDARD
    unless @std_cls_srv.exists(pesel) || @prm_cls_srv.exists(pesel)
      acc.pesel = pesel
      if acc.membership == Membership::PREMIUM
        @prm_cls_srv.put_client(acc)
      elsif acc.membership == Membership::STANDARD
        @std_cls_srv.put_client(acc)
      end

      return acc
    end
    # Raise exists
    x = InvalidOperation.new
    x.why = 'Client with given pesel already exists'
    x.arg_number = 1
    raise x
  end
end

