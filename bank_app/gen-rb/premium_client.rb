#
# Autogenerated by Thrift Compiler (0.12.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'standard_client'
require 'bank_types'

module PremiumClient
  class Client < ::StandardClient::Client 
    include ::Thrift::Client

    def request_loan(id, key, amount)
      send_request_loan(id, key, amount)
      return recv_request_loan()
    end

    def send_request_loan(id, key, amount)
      send_message('request_loan', Request_loan_args, :id => id, :key => key, :amount => amount)
    end

    def recv_request_loan()
      result = receive_message(Request_loan_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'request_loan failed: unknown result')
    end

  end

  class Processor < ::StandardClient::Processor 
    include ::Thrift::Processor

    def process_request_loan(seqid, iprot, oprot)
      args = read_args(iprot, Request_loan_args)
      result = Request_loan_result.new()
      result.success = @handler.request_loan(args.id, args.key, args.amount)
      write_result(result, oprot, 'request_loan', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Request_loan_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1
    KEY = 2
    AMOUNT = 3

    FIELDS = {
      ID => {:type => ::Thrift::Types::I64, :name => 'id'},
      KEY => {:type => ::Thrift::Types::STRING, :name => 'key'},
      AMOUNT => {:type => ::Thrift::Types::I64, :name => 'amount'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Request_loan_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::TransactionResponse}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

