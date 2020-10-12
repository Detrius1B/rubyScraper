require 'watir'
require 'json'
require_relative 'accounts'
require_relative 'transactions'

def get_transactions(account, account_link, browser)
  browser.goto(account_link)
  transactions = []

  puts browser.date_field(id: 'DateFrom').text

  # trs.each do |row|
  #   name = row.cell(:index => 1).text
  #   currency = row.cell(:index => 2).text
  #   balance = row.cell(:index => 4).text
  #   transactions << Transactions.new(date, description, amount, account.currency, account.name)
  # end

  # account.transaction =
end

browser = Watir::Browser.new(:chrome)
browser.goto('https://demo.bank-on-line.ru/')
btn = browser.div class: 'button-demo'
btn.exist?
btn.click
sleep 5

browser.element(id: 'lnkContracts').click
sleep 3

# get each rows from accounts table
trs = browser.trs(class: 'cp-item')
puts "Total accounts: #{trs.count}"
all_accounts = []
trs.each do |row|
  name = row.cell(index: 1).text
  currency = row.cell(index: 2).text
  balance = row.cell(index: 4).text
  all_accounts << Accounts.new(name, currency, balance, 'account', [])
end

# get transactions of each account
contracts_link = browser.url
all_accounts.each do |account|
  account_link = contracts_link + '/' + account.name + '/Transactions'
  # get_transactions(account, account_link, browser)
  browser.goto(account_link)

  # set 2 months history of transactions
  date = DateTime.now.prev_month(2)
  month = date.month.to_i - 1
  day = date.day.to_s
  browser.text_field(id: 'DateFrom').click
  title = browser.div(class: 'ui-datepicker-title')
  title.select(class: 'ui-datepicker-month').select(month.to_s)
  browser.link(text: day).click

  sleep 1
  browser.element(id: 'getTranz').click
  sleep 3

  # get each rows from transactions table
  trans_trs = browser.trs(class: 'cp-transaction')
  puts "Total transactions: #{trans_trs.count}"
  all_transactions = []
  trans_trs.each do |row|
    date = row.cell(index: 8).text
    description = row.cell(index: 6).text
    amount = if browser.td(class: 'cp-income').exist?
               '+' + row.cell(index: 9).text
             else
               '-' + row.cell(index: 9).text
             end

    account.transactions << Transactions.new(date, description, amount, account.currency, account.name)
  end


  # show all transactions
  # all_transactions.each do |trans|
  #   puts trans.puts_details
  # end

  puts "#{account.name} is done!"
end







# show all accounts
all_accounts.each do |acc|
  puts acc.puts_details
end




