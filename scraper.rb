require 'watir'
require 'json'
require_relative 'accounts'

browser = Watir::Browser.new(:chrome)
browser.goto('https://demo.bank-on-line.ru/')
btn = browser.div class: 'button-demo'
btn.exist?
btn.click
sleep 5

browser.element(id: 'lnkContracts').click
sleep 2

table = browser.table(id: 'contracts-list')
trs = browser.trs(class: 'cp-item')
puts "Total accounts: #{trs.count}"
all_accounts = []

trs.each do |row|
  name = row.cell(:index => 1).text
  currency = row.cell(:index => 2).text
  balance = row.cell(:index => 4).text

  all_accounts << Accounts.new(name, currency, balance, 'account', [])
end

all_accounts.each do |acc|
  puts acc.puts_details
end
# puts browser.url



