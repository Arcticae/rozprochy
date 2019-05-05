#
# Autogenerated by Thrift Compiler (0.12.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'bank_types'

module StandardClient
  class Client
    include ::Thrift::Client

    def get_balance(id, key)
      send_get_balance(id, key)
      return recv_get_balance()
    end

    def send_get_balance(id, key)
      send_message('get_balance', Get_balance_args, :id => id, :key => key)
    end

    def recv_get_balance()
      result = receive_message(Get_balance_result)
      return result.success unless result.success.nil?
      raise result.op unless result.op.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'get_balance failed: unknown result')
    end

    def put_money(key, id, amount)
      send_put_money(key, id, amount)
      return recv_put_money()
    end

    def send_put_money(key, id, amount)
      send_message('put_money', Put_money_args, :key => key, :id => id, :amount => amount)
    end

    def recv_put_money()
      result = receive_message(Put_money_result)
      return result.success unless result.success.nil?
      raise result.op unless result.op.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'put_money failed: unknown result')
    end

    def get_money(key, id, amount)
      send_get_money(key, id, amount)
      return recv_get_money()
    end

    def send_get_money(key, id, amount)
      send_message('get_money', Get_money_args, :key => key, :id => id, :amount => amount)
    end

    def recv_get_money()
      result = receive_message(Get_money_result)
      return result.success unless result.success.nil?
      raise result.op unless result.op.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'get_money failed: unknown result')
    end

    def put_client(client)
      send_put_client(client)
      recv_put_client()
    end

    def send_put_client(client)
      send_message('put_client', Put_client_args, :client => client)
    end

    def recv_put_client()
      result = receive_message(Put_client_result)
      return
    end

    def exists(id)
      send_exists(id)
      return recv_exists()
    end

    def send_exists(id)
      send_message('exists', Exists_args, :id => id)
    end

    def recv_exists()
      result = receive_message(Exists_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'exists failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_get_balance(seqid, iprot, oprot)
      args = read_args(iprot, Get_balance_args)
      result = Get_balance_result.new()
      begin
        result.success = @handler.get_balance(args.id, args.key)
      rescue ::InvalidOperation => op
        result.op = op
      end
      write_result(result, oprot, 'get_balance', seqid)
    end

    def process_put_money(seqid, iprot, oprot)
      args = read_args(iprot, Put_money_args)
      result = Put_money_result.new()
      begin
        result.success = @handler.put_money(args.key, args.id, args.amount)
      rescue ::InvalidOperation => op
        result.op = op
      end
      write_result(result, oprot, 'put_money', seqid)
    end

    def process_get_money(seqid, iprot, oprot)
      args = read_args(iprot, Get_money_args)
      result = Get_money_result.new()
      begin
        result.success = @handler.get_money(args.key, args.id, args.amount)
      rescue ::InvalidOperation => op
        result.op = op
      end
      write_result(result, oprot, 'get_money', seqid)
    end

    def process_put_client(seqid, iprot, oprot)
      args = read_args(iprot, Put_client_args)
      result = Put_client_result.new()
      @handler.put_client(args.client)
      write_result(result, oprot, 'put_client', seqid)
    end

    def process_exists(seqid, iprot, oprot)
      args = read_args(iprot, Exists_args)
      result = Exists_result.new()
      result.success = @handler.exists(args.id)
      write_result(result, oprot, 'exists', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Get_balance_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1
    KEY = 2

    FIELDS = {
      ID => {:type => ::Thrift::Types::I64, :name => 'id'},
      KEY => {:type => ::Thrift::Types::STRING, :name => 'key'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_balance_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    OP = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I64, :name => 'success'},
      OP => {:type => ::Thrift::Types::STRUCT, :name => 'op', :class => ::InvalidOperation}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Put_money_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    KEY = 1
    ID = 2
    AMOUNT = 3

    FIELDS = {
      KEY => {:type => ::Thrift::Types::STRING, :name => 'key'},
      ID => {:type => ::Thrift::Types::I64, :name => 'id'},
      AMOUNT => {:type => ::Thrift::Types::I64, :name => 'amount'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Put_money_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    OP = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::TransactionResponse},
      OP => {:type => ::Thrift::Types::STRUCT, :name => 'op', :class => ::InvalidOperation}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_money_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    KEY = 1
    ID = 2
    AMOUNT = 3

    FIELDS = {
      KEY => {:type => ::Thrift::Types::STRING, :name => 'key'},
      ID => {:type => ::Thrift::Types::I64, :name => 'id'},
      AMOUNT => {:type => ::Thrift::Types::I64, :name => 'amount'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Get_money_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    OP = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::TransactionResponse},
      OP => {:type => ::Thrift::Types::STRUCT, :name => 'op', :class => ::InvalidOperation}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Put_client_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CLIENT = 1

    FIELDS = {
      CLIENT => {:type => ::Thrift::Types::STRUCT, :name => 'client', :class => ::BankClient}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Put_client_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Exists_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1

    FIELDS = {
      ID => {:type => ::Thrift::Types::I64, :name => 'id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Exists_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
