require "bundler/setup"
require "openai"
require "dotenv/load"

openai = OpenAI::Client.new

chat_completion = openai.chat.completions.create(
  messages: [{role: "user", content: "Say this is a test"}],
  model: :"gpt-4.1"
)

puts(chat_completion)
