require 'rubygems'
require 'telegram/bot'
# require_relative 'secrets'

 token = '505261678:AAEnQgSUrWLoIhlu9JMhUWeyK4LI_t2CNT0'


Telegram::Bot::Client.run(token) do |bot|

  # your options
  options = [
    Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Pre-Sale ICOs', callback_data: 'touch'),
  ]

  # force open keyboard on mobile devices
  markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: options)

  bot.listen do |message|
    case message.text
    when Telegram::Bot::Types::CallbackQuery
      if message.text == 'touch'
        bot.api.send_message(chat_id: message.chat.id, text: 'you touched me')
      end
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'What would you like to do?', reply_markup: markup)
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end

end

#callback_data for ICOs needs to be the database of ICOs from admin, which needs to iterate through with numbers and data.
#support will return a contact to @joinMCT

# bot.listen do |message|
#   kb = [
#     Telegram::Bot::Types::KeyboardButton.new(text: 'Give me your phone number', request_contact: true),
#     Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)
#   ]
#   markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
#   bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)
# end

# bot.listen do |message|
#   case message
#   when Telegram::Bot::Types::CallbackQuery
#     # Here you can handle your callbacks from inline buttons
#     if message.data == 'touch'
#       bot.api.send_message(chat_id: message.from.id, text: "Don't touch me!")
#     end
#   when Telegram::Bot::Types::Message
#     kb = [
#       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Go to Google', url: 'https://google.com'),
#       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch'),
#       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Switch to inline', switch_inline_query: 'some text')
#     ]
#     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
#     bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
#   end
# end

  # when '/presaleicos'
  #     bot.api.send_message(chat_id: message.chat.id, text: "Ok, #{message.from.first_name} - here is what is available")
  #   when '/publicicos'
  #     bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
  #   when '/support'
  #     bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
  #   when '/referafriend'
  #     bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
