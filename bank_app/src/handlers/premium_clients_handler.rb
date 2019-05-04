cwd = File.dirname(__FILE__)
$LOAD_PATH << File.join(cwd, '..', '..', 'gen-rb')
require 'premium_client'
require 'bank_types'

class PremiumClientsHandler
  def initialize
    @premium_clients = {}
  end

  def put_client(client)
    @premium_clients[client.id] ||= client
  end

  def exists(id)
    @premium_clients[id]
  end

  private

  def validate_acc(id, key)
    if @premium_clients[id]
      @premium_clients[id].key == key
    else
      false
    end
  end

end

