
defmodule Tax do
  defrecord Order, id: nil, ship_to: nil, net_amount: nil, total_amount: nil

  def tax_rates_list do
    [ NC: 0.075, TX: 0.08 ]
  end

  def orders_list do
    [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] 
    ]
  end

  def calc_tax(orders, tax_rates) do
    Enum.map orders, fn order -> 
      keys = Dict.put(order, :total_amount, calc_total(order, tax_rates[order[:ship_to]]))
      Order.new keys
    end
  end

  def calc_total(order, _tax) when _tax == nil do
    order[:net_amount]
  end

  def calc_total(order, tax) do
    order[:net_amount] + tax
  end

  def read(filename) do
    {:ok, file} = File.open filename
    data = Enum.reduce IO.stream(file), [], fn line, listing -> 
      if !String.starts_with?(line, "id") do
        [ process(line) | listing ]
      else
        []
      end
    end
    Enum.reverse(data)
  end

  def process(line) do
    columns = String.split line, ","
    
    [
      id: _process_int(Enum.at(columns, 0)),
      ship_to: _process_sym(Enum.at(columns, 1)),
      net_amount: _process_dec(Enum.at(columns, 2))
    ]
  end

  def _process_int(string) do
    { id , _ } = String.to_integer(string)
    id
  end

  def _process_sym(string) do
    :"#{String.lstrip(string, ?:)}"
  end

  def _process_dec(string) do
    {float, _} = String.to_float(string)
    float
  end
end
