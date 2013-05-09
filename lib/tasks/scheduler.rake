desc "This task is called by the Heroku scheduler add-on"
task :send_emails => :environment do
	emails = Email.joins(:recipient).where("recipients.enabled is true AND send_time < ? AND sent is not true", Time.zone.now).readonly(false)
	emails.each do |email|
		mail = Mail.deliver do
		  from     email.recipient.campaign.user.email
		  to       email.recipient.email
		  bcc	   email.recipient.campaign.user.bcc
		  subject  email.subject
		  body     email.body
		  delivery_method :smtp, { 
		  	:address => 'smtp.gmail.com',
		  	:port => '587',
		  	:user_name => email.recipient.campaign.user.email,
		  	:password => email.recipient.campaign.user.email_password,
		  	:authentication => :plain,
		  	:enable_starttls_auto => true
		  }
		end
		email.sent = true
		email.save
	end
end