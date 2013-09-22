
IO.puts "I am a cat"

fizz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

fizzbuzz = fn
  n -> fizz.(rem(n, 3), rem(n, 5), n)
end

IO.puts fizz.(0, 2, 3)

IO.puts fizz.(0, 0, 3)
IO.puts fizz.(9, 0, 3)
IO.puts fizz.(9, 2, 3)

IO.puts fizzbuzz.(10)
IO.puts fizzbuzz.(11)
IO.puts fizzbuzz.(12)
IO.puts fizzbuzz.(13)
IO.puts fizzbuzz.(14)
IO.puts fizzbuzz.(15)
IO.puts fizzbuzz.(16)

prefix = fn title -> (fn name -> "#{title} #{name}" end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1, 2, 3, 4], &IO.puts &1

