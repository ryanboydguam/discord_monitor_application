require 'discordrb'
require 'discordrb/container'
require 'discordrb/events/channels'
require 'net/ping'
Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
#Class IP address
#Used to store information to check if the website is online or you can ping the ip address
#Address : The ip address or website address
#Location : The location of the server or ip
#TimeCheck : the date that these addresses where last checked
#Status : The current status of each address
class IPADDRESS
attr_accessor :address, :Location, :TimeCheck, :status
end
#Class InformationNode
#Just information blocks that discord uses to edit and display data.
#This allows you to control and edit past messages sent from the bot to discord
#Datablock : Any information that needs to be stored temporaly
class InformationNode
attr_accessor :dataBook
end
checkcycle = 10 #Delay in seconds. Check Cycle of servers and ip addresses
dcConstant = "" # the constant saved so the bot only works in this channel
ipArray = Array.new(10) { IPADDRESS.new }
inArray = Array.new(11) { InformationNode.new }
infoblocks = Array.new(3) { InformationNode.new }
bot = Discordrb::Commands::CommandBot.new token: 'ODcyMTgyMTE3MDg0MzExNjIy.YQmI5Q.-zdY0zNG5XnVgi079e_UwD5CNEU'
timeClock = "Current Time : #{Time.now}"
messages = Array["SETUP IS NOW IN PROGRESS","```Please Wait for Setup to complete```"]
puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

def messageBlock(message)
  return "```#{message}```"
end
bot.message(content: '!Setup') do |event|
  event.message.delete
  infoblocks[0].dataBook = event.respond "#{messages[0]} \n #{messages[1]}"
  dcConstant = event.channel.name
  infoblocks[0].dataBook.edit "#{messages[0]} \n [#{dcConstant}] Is now the primary Channel. \n#{messages[1]}"
  sleep(5)
  infoblocks[0].dataBook.edit "#{messages[0]} Channel #{dcConstant}"
  ipArray[0].address = "192.168.1.10"
  inArray[0].dataBook = event.respond "Server [#{ipArray[0].address}] is: Online"
  infoblocks[1].dataBook = event.respond "```SETUP IS NOW COMPLETE. Services will be checked every #{checkcycle} Seconds```"
end

  bot.message(content: '!chantest') do |event|
    if event.channel.name == "#{dcConstant}"
      test = event.content
      test = event.message.delete
      event.respond "#{test}"
    end
  end



bot.message(content: '!channeltest') do |event|
  if event.channel.name == 'test-channel-2'
    event.message.delete
    event.respond "```Test in progress```"
  else
    event.respond "```please use the correct channel```"
  end
end
bot.message(content: '!Setups') do |event|
  event.message.delete

#      if(ONLINE == true)
#        aws_ip_1.address = event.respond "Online" + ":green_circle:"
#        p  Net::HTTP.new("www.envisionps.net").head('/').kind_of? Net::HTTPOK
#      else
#        aws_ip_1.address = event.respond "1" + ":red_circle:"
#      end
#
#          aws_ip_2.address = event.respond "Online2"

  infoblocks[0].dataBook = event.respond "```SETUP IS NOW IN PROGRESS```"
  ipArray[0].address = "192.168.1.10"
  inArray[0].dataBook = event.respond "Server [#{ipArray[0].address}] is: Online"
  infoblocks[1].dataBook = event.respond "```SETUP IS NOW COMPLETE. Services will be checked every #{checkcycle} Seconds```"
end

bot.message(content: '!down') do |event|
    event.message.delete
    infoblocks[1].dataBook.edit "```<@203906109067493377> The Server is down```"
end

bot.message(content: '!clear') do |event|
  event.message.delete
  infoblocks[0].dataBook.delete
  inArray[0].dataBook.delete
  infoblocks[1].dataBook.delete
  # node1.dataBook.edit "Server [#{aws_ip_1.address}] is: #{aws_ip_1.status}"

end

#bot.message do |event|
#  event.message.delete
#end

bot.run
