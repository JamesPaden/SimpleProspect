desc "This task is called by the Heroku scheduler add-on"
task :send_emails => :environment do
	emails = Email.joins(:recipient).where("recipients.enabled is true AND send_time < ? AND sent is not true", Time.zone.now).readonly(false)
	emails.each do |email|
		from = email.recipient.campaign.user.email
		if email.recipient.campaign.user.name
			from = email.recipient.campaign.user.name + "<" + email.recipient.campaign.user.email + ">"
		end
		mail = Mail.deliver do
		  from     from
		  to       email.recipient.email
		  bcc	   email.recipient.campaign.user.bcc
		  subject  email.subject
		  html_part do
		    content_type 'text/html; charset=UTF-8'
		    body email.body + "<img src='http://www.simpleprospect.com/assets/images/" + email.id + "/spacer.png' width='1' height='1' />"
		  end
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