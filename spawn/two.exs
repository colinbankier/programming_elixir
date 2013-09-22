import :timer, only: [ sleep: 1 ]

defmodule Two do
  def respond(caller, sleep_time) do
    receive do 
      word ->
        IO.puts "#{word} sleeping for #{sleep_time}"
        sleep sleep_time
        caller <- word
    end
  end

  def run() do
    first = spawn(Two, :respond, [self, :random.uniform(500)])
    second = spawn(Two, :respond, [self, :random.uniform(500)])

    second <- "betty1"
    first <- "fred"

    receive do
      response ->
        IO.puts response
    end

    receive do
      response ->
        IO.puts response
    end
  end
end
