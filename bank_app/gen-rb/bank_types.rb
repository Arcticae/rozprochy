#
# Autogenerated by Thrift Compiler (0.12.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Membership
  STANDARD = 0
  PREMIUM = 1
  VALUE_MAP = {0 => "STANDARD", 1 => "PREMIUM"}
  VALID_VALUES = Set.new([STANDARD, PREMIUM]).freeze
end

class BankClient; end

class TransactionResponse; end

class InvalidOperation < ::Thrift::Exception; end

class BankClient
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ID = 1
  MEMBERSHIP = 2
  BALANCE = 3

  FIELDS = {
    ID => {:type => ::Thrift::Types::I64, :name => 'id'},
    MEMBERSHIP => {:type => ::Thrift::Types::I32, :name => 'membership', :enum_class => ::Membership},
    BALANCE => {:type => ::Thrift::Types::I64, :name => 'balance'}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @membership.nil? || ::Membership::VALID_VALUES.include?(@membership)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field membership!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

class TransactionResponse
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ACCEPTED = 1
  REASON = 2

  FIELDS = {
    ACCEPTED => {:type => ::Thrift::Types::BOOL, :name => 'accepted'},
    REASON => {:type => ::Thrift::Types::STRING, :name => 'reason', :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class InvalidOperation < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  WHY = 1
  ARG_NUMBER = 2

  FIELDS = {
    WHY => {:type => ::Thrift::Types::STRING, :name => 'why'},
    ARG_NUMBER => {:type => ::Thrift::Types::I32, :name => 'arg_number'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end
