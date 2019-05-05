cwd = File.dirname(__FILE__)
$LOAD_PATH << File.join(cwd, '..', 'gen-rb')
require 'account_creator'
require 'bank_types'
require 'standard_client'
require 'premium_client'
require 'securerandom'

class AccountCreatorHandler
  def initialize
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', 2020))
    prm_cls_proto_multiplex = Thrift::MultiplexedProtocol.new(Thrift::BinaryProtocol.new(transport),'PRM_CLS')
    std_cls_proto_multiplex = Thrift::MultiplexedProtocol.new(Thrift::BinaryProtocol.new(transport), 'STD_CLS')
    @prm_cls_srv = PremiumClient::Client.new(prm_cls_proto_multiplex)
    @std_cls_srv = StandardClient::Client.new(std_cls_proto_multiplex)
    transport.open
  end

  def create_account(id, income, currency)
    puts "#{Time.now} received create acc request with id: #{id} and income of #{income}, with currency: #{currency}"
    if income < 0
      x = InvalidOperation.new
      puts "#{Time.now} creating service raised exception: cannot create account with negative income"
      x.why = 'Income cannot be less than 0'
      x.arg_number = 2
      raise x
    end

    acc = BankClient.new
    # TODO: change premium determining?
    acc.membership = income > 1000 ? Membership::PREMIUM : Membership::STANDARD
    acc.income = income
    acc.key = SecureRandom.hex[0..5]
    acc.currency = Currency::VALID_VALUES.include?(currency) ? currency : Currency::PLN

    unless @std_cls_srv.exists(id) || @prm_cls_srv.exists(id)
      acc.id = id
      if acc.membership == Membership::PREMIUM
        @prm_cls_srv.put_client(acc)
      elsif acc.membership == Membership::STANDARD
        @std_cls_srv.put_client(acc)
      end
      puts "#{Time.now} created new client id: #{id}, key: #{acc.key}, income: #{income}"
      return acc
    end
    # Raise exists
    puts "#{Time.now} creating service raised exception: account with given credentials exists"
    x = InvalidOperation.new
    x.why = 'Client with given pesel already exists'
    x.arg_number = 1
    raise x
  end
end

