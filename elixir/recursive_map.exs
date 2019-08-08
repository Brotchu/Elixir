defmodule Tax do
  @taxagent "Christoph Waltz"
  def do_tax([]), do: []
  def do_tax([head|tail]) do

    updated_amount = %{acct_num: head.acct_num,
      income: head.income,
      tax: check_percent(head.income),
      tax_amount: head.income*check_percent(head.income)/100,
      tax_agent: "#{@taxagent} & CO"
    }

    [updated_amount | do_tax(tail)]
  end

  def check_percent(num) when num >500000 , do: 15
  def check_percent(_), do: 5
end
