class Accounts
  attr_accessor :name, :currency, :balance, :nature, :transactions

  def initialize(make, currency, balance, nature, transactions)
    @name = make
    @currency = currency
    @balance = balance
    @nature = nature
    @transactions = transactions
  end

  def puts_details
    account = {
      accounts: [
        { name: @name,
          currency: @currency,
          balance: @balance,
          nature: @nature,
          transactions: @transactions }
      ]
    }
    puts JSON.pretty_generate(account)
  end
end
