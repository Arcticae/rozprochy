cwd = File.dirname(__FILE__)
$LOAD_PATH << File.join(cwd, '..', '..', 'gen-rb')
require 'standard_client'
require 'bank_types'

class StandardClientsHandler
  def initialize
    @standard_clients = {}
  end

  def put_client(client)
    @standard_clients[client.id] ||= client
  end

  def exists(id)
    @standard_clients[id]
  end

  def get_balance(id, key)
    raise_unauthorised unless validate_acc(id, key)

    @standard_clients[id].balance
  end

  def put_money(id, key, money)
    raise_unauthorised unless validate_acc(id, key)

  end

  def get_money(id, key, money)
    raise_unauthorised unless validate_acc(id, key)
  end


  private

  def validate_acc(id, key)
    if @standard_clients[id]
      @standard_clients[id].key == key
    end
  end

  def raise_unauthorised
    x = InvalidOperation.new
    x.why = 'Unauthorized operation or client does not exist'
    x.arg_number = 2
    raise x
  end

end
