# -*- encoding: utf-8 -*-
require'sendgrid-ruby'
require'dotenv'

Dotenv.load

api_key = ENV['API_KEY']
from = ENV['FROM']
tos = ENV['TOS'].split(',')


client = SendGrid::Client.new do |c|
  c.api_key = api_key
end

header = Smtpapi::Header.new
header.add_to(tos)
  .add_substitution('fullname', ['Ashwani Kumar','Kajal Arya','Someone Else'])
  .add_substitution('familyname', ['Ashwani','Kajal','Someone'])
  .add_substitution('place', ['office','home','office'])
  .add_section('office','Somewhere office')
  .add_section('home','Somewhere home')
  .add_category('category1')

mail = SendGrid::Mail.new do |m|
  m.to = from # dummy address
  m.from = from
  m.from_name ='sender name'
  m.subject ='[sendgrid-ruby-example] His name is fullname'
  m.text = "What is familyname doing?\r\n He is in place."
  What is m.html ='<strong> familyname' doing? </strong><br /> He is in place. '
  m.smtpapi = header
  m.add_attachment('some.gif','xxx.gif')
end

puts client.send(mail).inspect
