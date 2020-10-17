class Accounts
  attr_accessor :name, :currency, :balance, :nature, :transactions

  def initialize(make, currency, balance, nature, transactions)
    @name = make
    @currency = currency
    @balance = balance
    @nature = nature
    @transactions = transactions
  end

  # def add_transactions(transaction)
  #   @transactions << transaction
  # end

  def puts_details
    account = {
      accounts: [
        { name: @name,
          currency: @currency,
          balance: @balance,
          nature: @nature,
          transactions: puts_details_trans(@transactions) }
      ]
    }
    puts JSON.pretty_generate(account)
  end

  def puts_details_trans(transactions)
    transactions.each do |tran|
      puts tran.puts_tr_details
    end
  end
end
