require 'rubygems'
require 'telegram/bot'
require_relative 'token'

Telegram::Bot::Client.run(token) do |bot|
  puts "Hello I'm a Bot"
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}! What would you like to do? 1) /presaleicos 2) /publicicos 3) /referafriend")
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    when '/presaleicos'
      bot.api.send_message(chat_id: message.chat.id, text: "Ok, #{message.from.first_name} - here is what is available")
    when '/publicicos'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    when '/referafriend'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end
