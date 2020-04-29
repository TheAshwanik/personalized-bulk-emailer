# personalized-bulk-emailer

A bulk email program that sends personalized emails to all the gmail contacts with a custom salutation for each email.

- This script came out of the necessity when I had to send a couple hundred emails for my wedding invitations. I plan to make it more featureful and generic if and when time allows.

## The Problem
When sending bulk email invitations or notifications, there is no single 'one-salutation-fits-all' approach. Most common way of sending such emails is to send a single email having all the email addresses listed in the bcc section of this email. This does not add a personal touch to to these emails.

## The Solution
This ruby program iterates over all the emails in a gmail contact group and asks the salutation for each email. Users can choose to select any one of the suggested Salutation or choose a custom salutation. Thereafter this email is sent with appropriate body (HTML supported) and attachments.

The program as three main components:

* **google.csv**
    * The csv file generated by gmail consisting of all your contacts.
    * The contacts can be just a specific group also.
    * To generate. Log on to gmail -> Contacts -> Press "More" Button -> Select "Export" -> Select the Google CSV format.
    * In pipeline - The next version of this program will directly import this information from gmail.

* **body.htm**
    * This is the actual email content in HTML(or plain text) form. This is everything except the first line (salutation). 
Salutation will be appended by the emailer.rb program.

* **emailer.rb**
    * Run by using command 'ruby emailer.rb' on the command line.
    * Iterates over the list of email addresses in google.csv
    * For each email address, gives options for some canned Salutations. Users can choose the canned ones or choose to enter a custom salutation for this email id.

A Sample interaction with the script is shown below:

![alt text](https://github.com/shivampatel/personalized-bulk-emailer/raw/master/screenshot.png "Sample interation with this script 1")