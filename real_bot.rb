require 'rubygems'
require 'telegram/bot'
# require_relative 'secrets'

TOKEN = '526488930:AAFc4x-ntuk0Y_2Mae1wbgupMp6UL_6gV1E'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      options = [
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Me', switch_inline_query_current_chat: 'Great, live your truth.'),
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'A Diff Fish', switch_inline_query: '...feeling your vibes today'),
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'We', url: 'http://www.think.fish/')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: options)
      bot.api.send_message(chat_id: message.chat.id, text: 'Who are you today?', reply_markup: markup)
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Are you crazy? Get lost.")
    end
  end

end
