$LOAD_PATH << File.join(File.dirname(__FILE__), 'handlers')

require 'thrift'
require 'thrift/multiplexed_processor'
require 'standard_clients_handler'
require 'premium_clients_handler'
require 'account_creator_handler'

# require generated classes from thrift


# Init handlers
st_cl_handler = StandardClientsHandler.new
pr_cl_handler = PremiumClientsHandler.new

# Init processors
multiplexed_processor = Thrift::MultiplexedProcessor.new
st_cl_processor = StandardClient::Processor.new(st_cl_handler)
pr_cl_processor = PremiumClient::Processor.new(pr_cl_handler)
multiplexed_processor.register_processor('STD_CLS', st_cl_processor)
multiplexed_processor.register_processor('PRM_CLS', pr_cl_processor )
# Init transports

cls_transport = Thrift::ServerSocket.new(2020)

# Create transport factory and server objects
transport_factory = Thrift::BufferedTransportFactory.new

all_cls_server = Thrift::SimpleServer.new(multiplexed_processor, cls_transport, transport_factory)


# Start
case ARGV[0]
when 'ALL_CLS'
  puts 'Starting ALL_CLS server'
  all_cls_server.serve
when 'ACC_CRS'
  acc_handler = AccountCreatorHandler.new
  acc_processor = AccountCreator::Processor.new(acc_handler)
  acc_transport = Thrift::ServerSocket.new(9090)
  acc_server = Thrift::SimpleServer.new(acc_processor, acc_transport, transport_factory)
  puts 'Starting  ACC_CRS server'
  acc_server.serve
else
  raise ArgumentError, 'Invalid arg provided for ruby script'
end