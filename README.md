1.Enter the data in seed.rb
2.Run application as rails s -b 0.0.0.0 -p 3000
3.There two views one as donor and one as receiver, the username is phone number.
4.once u create an event in donor view you should get code in sms and mail
	-> to get sms 
		1.login to https://www.twilio.com  and add the phone numbers of all Receiver under "https://www.twilio.com/console/phone-numbers/verified"
			(Trail account username:-tester.developer.2412@gmail.com password:- Welcome@123Welcome@123)
	-> to get mail 
		2.search for user_mail.rb and add your mail as default email_id
