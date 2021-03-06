#
# Autogenerated by Thrift Compiler (0.12.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
#  options string: py
#

from thrift.Thrift import TType, TMessageType, TFrozenDict, TException, TApplicationException
from thrift.protocol.TProtocol import TProtocolException
from thrift.TRecursive import fix_spec

import sys
import bank.StandardClient
import logging
from .ttypes import *
from thrift.Thrift import TProcessor
from thrift.transport import TTransport
all_structs = []


class Iface(bank.StandardClient.Iface):
    def request_loan(self, id, key, loan_params):
        """
        Parameters:
         - id
         - key
         - loan_params

        """
        pass


class Client(bank.StandardClient.Client, Iface):
    def __init__(self, iprot, oprot=None):
        bank.StandardClient.Client.__init__(self, iprot, oprot)

    def request_loan(self, id, key, loan_params):
        """
        Parameters:
         - id
         - key
         - loan_params

        """
        self.send_request_loan(id, key, loan_params)
        return self.recv_request_loan()

    def send_request_loan(self, id, key, loan_params):
        self._oprot.writeMessageBegin('request_loan', TMessageType.CALL, self._seqid)
        args = request_loan_args()
        args.id = id
        args.key = key
        args.loan_params = loan_params
        args.write(self._oprot)
        self._oprot.writeMessageEnd()
        self._oprot.trans.flush()

    def recv_request_loan(self):
        iprot = self._iprot
        (fname, mtype, rseqid) = iprot.readMessageBegin()
        if mtype == TMessageType.EXCEPTION:
            x = TApplicationException()
            x.read(iprot)
            iprot.readMessageEnd()
            raise x
        result = request_loan_result()
        result.read(iprot)
        iprot.readMessageEnd()
        if result.success is not None:
            return result.success
        raise TApplicationException(TApplicationException.MISSING_RESULT, "request_loan failed: unknown result")


class Processor(bank.StandardClient.Processor, Iface, TProcessor):
    def __init__(self, handler):
        bank.StandardClient.Processor.__init__(self, handler)
        self._processMap["request_loan"] = Processor.process_request_loan

    def process(self, iprot, oprot):
        (name, type, seqid) = iprot.readMessageBegin()
        if name not in self._processMap:
            iprot.skip(TType.STRUCT)
            iprot.readMessageEnd()
            x = TApplicationException(TApplicationException.UNKNOWN_METHOD, 'Unknown function %s' % (name))
            oprot.writeMessageBegin(name, TMessageType.EXCEPTION, seqid)
            x.write(oprot)
            oprot.writeMessageEnd()
            oprot.trans.flush()
            return
        else:
            self._processMap[name](self, seqid, iprot, oprot)
        return True

    def process_request_loan(self, seqid, iprot, oprot):
        args = request_loan_args()
        args.read(iprot)
        iprot.readMessageEnd()
        result = request_loan_result()
        try:
            result.success = self._handler.request_loan(args.id, args.key, args.loan_params)
            msg_type = TMessageType.REPLY
        except TTransport.TTransportException:
            raise
        except TApplicationException as ex:
            logging.exception('TApplication exception in handler')
            msg_type = TMessageType.EXCEPTION
            result = ex
        except Exception:
            logging.exception('Unexpected exception in handler')
            msg_type = TMessageType.EXCEPTION
            result = TApplicationException(TApplicationException.INTERNAL_ERROR, 'Internal error')
        oprot.writeMessageBegin("request_loan", msg_type, seqid)
        result.write(oprot)
        oprot.writeMessageEnd()
        oprot.trans.flush()

# HELPER FUNCTIONS AND STRUCTURES


class request_loan_args(object):
    """
    Attributes:
     - id
     - key
     - loan_params

    """


    def __init__(self, id=None, key=None, loan_params=None,):
        self.id = id
        self.key = key
        self.loan_params = loan_params

    def read(self, iprot):
        if iprot._fast_decode is not None and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None:
            iprot._fast_decode(self, iprot, [self.__class__, self.thrift_spec])
            return
        iprot.readStructBegin()
        while True:
            (fname, ftype, fid) = iprot.readFieldBegin()
            if ftype == TType.STOP:
                break
            if fid == 1:
                if ftype == TType.I64:
                    self.id = iprot.readI64()
                else:
                    iprot.skip(ftype)
            elif fid == 2:
                if ftype == TType.STRING:
                    self.key = iprot.readString().decode('utf-8') if sys.version_info[0] == 2 else iprot.readString()
                else:
                    iprot.skip(ftype)
            elif fid == 3:
                if ftype == TType.STRUCT:
                    self.loan_params = LoanParams()
                    self.loan_params.read(iprot)
                else:
                    iprot.skip(ftype)
            else:
                iprot.skip(ftype)
            iprot.readFieldEnd()
        iprot.readStructEnd()

    def write(self, oprot):
        if oprot._fast_encode is not None and self.thrift_spec is not None:
            oprot.trans.write(oprot._fast_encode(self, [self.__class__, self.thrift_spec]))
            return
        oprot.writeStructBegin('request_loan_args')
        if self.id is not None:
            oprot.writeFieldBegin('id', TType.I64, 1)
            oprot.writeI64(self.id)
            oprot.writeFieldEnd()
        if self.key is not None:
            oprot.writeFieldBegin('key', TType.STRING, 2)
            oprot.writeString(self.key.encode('utf-8') if sys.version_info[0] == 2 else self.key)
            oprot.writeFieldEnd()
        if self.loan_params is not None:
            oprot.writeFieldBegin('loan_params', TType.STRUCT, 3)
            self.loan_params.write(oprot)
            oprot.writeFieldEnd()
        oprot.writeFieldStop()
        oprot.writeStructEnd()

    def validate(self):
        return

    def __repr__(self):
        L = ['%s=%r' % (key, value)
             for key, value in self.__dict__.items()]
        return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

    def __eq__(self, other):
        return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not (self == other)
all_structs.append(request_loan_args)
request_loan_args.thrift_spec = (
    None,  # 0
    (1, TType.I64, 'id', None, None, ),  # 1
    (2, TType.STRING, 'key', 'UTF8', None, ),  # 2
    (3, TType.STRUCT, 'loan_params', [LoanParams, None], None, ),  # 3
)


class request_loan_result(object):
    """
    Attributes:
     - success

    """


    def __init__(self, success=None,):
        self.success = success

    def read(self, iprot):
        if iprot._fast_decode is not None and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None:
            iprot._fast_decode(self, iprot, [self.__class__, self.thrift_spec])
            return
        iprot.readStructBegin()
        while True:
            (fname, ftype, fid) = iprot.readFieldBegin()
            if ftype == TType.STOP:
                break
            if fid == 0:
                if ftype == TType.STRUCT:
                    self.success = TransactionResponse()
                    self.success.read(iprot)
                else:
                    iprot.skip(ftype)
            else:
                iprot.skip(ftype)
            iprot.readFieldEnd()
        iprot.readStructEnd()

    def write(self, oprot):
        if oprot._fast_encode is not None and self.thrift_spec is not None:
            oprot.trans.write(oprot._fast_encode(self, [self.__class__, self.thrift_spec]))
            return
        oprot.writeStructBegin('request_loan_result')
        if self.success is not None:
            oprot.writeFieldBegin('success', TType.STRUCT, 0)
            self.success.write(oprot)
            oprot.writeFieldEnd()
        oprot.writeFieldStop()
        oprot.writeStructEnd()

    def validate(self):
        return

    def __repr__(self):
        L = ['%s=%r' % (key, value)
             for key, value in self.__dict__.items()]
        return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

    def __eq__(self, other):
        return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not (self == other)
all_structs.append(request_loan_result)
request_loan_result.thrift_spec = (
    (0, TType.STRUCT, 'success', [TransactionResponse, None], None, ),  # 0
)
fix_spec(all_structs)
del all_structs

