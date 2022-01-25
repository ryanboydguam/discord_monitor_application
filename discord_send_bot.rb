require 'discordrb'
require 'discordrb/container'
require 'discordrb/events/channels'
require 'net/ping'
Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
bot = Discordrb::Commands::CommandBot.new token: 'ODcyMTgyMTE3MDg0MzExNjIy.YQmI5Q.-zdY0zNG5XnVgi079e_UwD5CNEU'
bot.message(content: '!Setup') do |event|
    event.message.delete
    dcConstant = event.channel.name
    event.respond "test #{dcConstant}"
end
bot.send_message(933711410230333471,"hello")
