require "bundler/setup"
require "openai"
require "dotenv/load"

class Main
  def chat_completion_example
    chat_completion = openai.chat.completions.create(
      messages: [{role: "user", content: "Say this is a test"}],
      model: :"gpt-4.1"
    )

    puts(chat_completion)
  end

  def stream_example
    stream = openai.chat.completions.stream_raw(
      messages: [{role: "user", content: "Say this is a test"}],
      model: :"gpt-4.1"
    )
    stream.each do |completion|
      print completion.choices.first.delta.content
    end
  end

  private

  def openai
    @openai ||= OpenAI::Client.new
  end
end

main = Main.new

main.chat_completion_example
main.stream_example
