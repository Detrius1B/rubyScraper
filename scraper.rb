require 'watir'

browser = Watir::Browser.new(:chrome)
browser.goto('https://demo.bank-on-line.ru/')
btn = browser.div class: 'button-demo'
btn.exist?
btn.click
sleep 5