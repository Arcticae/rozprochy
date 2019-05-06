cwd = File.dirname(__FILE__)
$LOAD_PATH << File.join(cwd, '..', 'gen-rb')
require 'premium_client'
require 'bank_types'

class PremiumClientsHandler
  def initialize
    @premium_clients = {}
  end

  def put_client(client)
    puts "#{Time.now} putting client #{client.id} in premium database"
    @premium_clients[client.id] ||= client
  end

  def exists(id)
    @premium_clients[id] ? true : false
  end

  def get_balance(id, key)
    puts "#{Time.now} getting client's: #{id} balance..."
    raise_unauthorised unless validate_acc(id, key)
    @premium_clients[id].income
  end

  def put_money(id, key, money)
    raise_unauthorised unless validate_acc(id, key)
    @premium_clients[id].income += money
    puts "#{Time.now} putting #{money} cash in #{id} account"

    res = TransactionResponse.new
    res.accepted = true
    res.reason = "Cash input accepted, current income: #{@premium_clients[id].income}"
    res
  end

  def get_money(id, key, money)
    raise_unauthorised unless validate_acc(id, key)
    res = TransactionResponse.new
    if @premium_clients[id].income - money < 0
      res.accepted = false
      res.reason = 'Cash withdrawal rejected, not sufficient funds for this operation'
    else
      puts "#{Time.now} withdrawing #{money} cash in #{id} account"
      res.accepted = true
      res.reason = "Cash withdrawal accepted, current balance: #{@premium_clients[id].income}"
    end
    res
  end

  def request_loan(id, key, loan_params)
    puts "#{Time.now} request for a loan from #{id}, with params: #{loan_params}"
    raise_unauthorised unless validate_acc(id, key)
    res = TransactionResponse.new
    if permit_loan(id, loan_params)
      res.accepted = true
      @premium_clients[id].active_loan = true
    else
      res.accepted = false
      res.reason = "You cannot have this loan, either you have too small income or you have an active loan already"
    end
  end

  private

  def permit_loan(id, loan_params)
    client = @premium_clients[id]
    return false if client.active_loan

    income = client.income
    native = client.currency
    requested = loan_params.currency
    loan_params.money < translate_moneys(native, requested, (loan_params.months * income))
  end

  # TODO: translate moneys from service
  def translate_moneys(from, to, value)
    if from == to
      value
    else
      # value * @currency_provider.getValueOf(from, to)
      value * 1.1
    end
  end

  def validate_acc(id, key)
    if @premium_clients[id]
      @premium_clients[id].key == key
    else
      false
    end
  end

end

