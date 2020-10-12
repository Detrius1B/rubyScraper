class Transactions
  attr_accessor :date, :description, :amount, :currency, :account_name

  def initialize(date, description, amount, currency, account_name)
    @date = date
    @description = description
    @amount = amount
    @currency = currency
    @account_name = account_name
  end

  def puts_details
    transaction = {
      transactions: [
        { date: @date,
          description: @description,
          amount: @amount,
          currency: @currency,
          account_name: @account_name }
      ]
    }
    puts JSON.pretty_generate(transaction)
  end
end

