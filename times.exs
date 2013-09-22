defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n) do
    n * 3
  end

  def quadruple(n) do
    double double(n)
  end

  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)

  def gcd(x, 0), do: x
  def gcd(x, y) do
    IO.puts "#{x} #{y}"
    gcd(y, rem(x,y))
  end

  def guess(target, a..b) do
    the_guess = a + div(b - a, 2)
    #IO.puts the_guess
    check_guess(target, the_guess, a..b)
  end

  def check_guess(target, the_guess, _) when target == the_guess do
    IO.puts target
  end

  def check_guess(target, the_guess, a..b) when the_guess < target do
    IO.puts "Is it #{the_guess}"
    guess(target, (the_guess + 1)..b)
  end

  def check_guess(target, the_guess, a..b) when the_guess > target do
    IO.puts "Is it #{the_guess}"
    guess(target, a..(the_guess - 1))
  end
  
end

