defmodule MyList do
  def sum([], total), do: total
  def sum([ head | tail ], total), do: sum(tail, head + total)

  def sum2([]), do: 0
  def sum2([ head | tail ]), do: head + sum2(tail)

  def map([], _func), do: []
  def map( [ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum(list, func) do
    map(list, func) |> reduce(0, &(&1 + &2))
  end

  def max(list) do
    _max(list, 0)
  end

  def _max([], current_max) do
    current_max
  end

  def _max( [ head | tail ], current_max) when head > current_max do
    _max(tail, head)
  end

  def _max( [ head | tail ], current_max) when head < current_max do
    _max(tail, current_max)
  end

  def ceasar(list, n) do
    map(list, &(wrap(&1 + n)))
  end

  def wrap(n) when n > 122 do
    n - 26
  end

  def wrap(n) do
    n
  end

  def span(a..b) do
    Enum.reverse(_span([], a..b))
  end

  def _span(list, a..b) when a > b do
    list
  end

  def _span(list, a..b) do
    _span([ a | list ] , (a + 1)..b)
  end

  def all?(list, func) do
    reduce(list, true, &(func.(&1) && &2))
  end

  def filter(list, func) do
    Enum.reverse(_filter([], list, func))
  end

  def _filter(filtered, [], _func) do
    filtered
  end

  def _filter(filtered, [ head | tail ], func) do
    if func.(head) do
      _filter([ head | filtered ], tail, func)
    else
      _filter(filtered, tail, func)
    end
  end

  def split(list, num) do
    _split([], list, 0, num)
  end

  def _split(first, last, taken, to_take) when taken >= to_take do
    {Enum.reverse(first), last}
  end

  def _split(first, [ head | tail ], taken, to_take) do
    _split( [ head | first ], tail, taken + 1, to_take)
  end

  def flatten(list) do
  end

  def _flatten([ head = [] | tail ]) do
    [ _flatten(head) | tail ]
  end

  def _flatten(list = [ head | tail ]) do
    
end
