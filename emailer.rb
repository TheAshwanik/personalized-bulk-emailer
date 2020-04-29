require 'active_support/all'
require 'gmail'

f = File.open("google.csv")
body = File.read("body.htm")
gmail = Gmail.new("your.email.id@gmail.com", "your_gmail_password")

choice = []
f.each_line do |line|
  fields = line.split(",")
  fname = fields[1].titlecase
  hi = "Hi #{fname}"
  dear = "Dear #{fname}"
  dear_sir = "Dear #{fname} Sir"
  dear_maam = "Dear #{fname} Ma'am"
  email_id = fields[28].strip
  begin
    puts "Salutation Options for '#{fields[0]}' => #{email_id}:\n 1.) #{hi}\t 2.) #{dear}\t 3.) #{dear_sir}\t 4. #{dear_maam}\t 5.) Custom"
    STDOUT.flush
    choice = gets.chomp
  end until !choice.scan(/(1|2|3|4|5)/)[0].nil?

  salutation = hi # default salutation is Hi Name,
  case choice.to_i
  when 1
    salutation = hi
  when 2
    salutation = dear
  when 3
    salutation = dear_sir
  when 4
    salutation = dear_maam
  when 5
    puts "Enter Salutation: "
    STDOUT.flush
    salutation = gets.chomp
  end

  email_body = salutation + "," + body

  # send email here
  gmail.deliver do
    to email_id
    subject "Birthday invitation"
    from "Your Name <your.email.id@gmail.com>"
    html_part do
      content_type 'text/html; charset=UTF-8'
      body email_body
    end
  add_file "./invitation.jpg"
  end
  puts "--------------------- Email sent to #{email_id} with salutation '#{salutation}' --------------------------\n"
  # puts email_body
end

gmail.logout
