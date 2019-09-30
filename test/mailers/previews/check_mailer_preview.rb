# Preview all emails at http://localhost:3000/rails/mailers/check_mailer
class CheckMailerPreview < ActionMailer::Preview
	
	def prof_to_utp_email
		CheckMailer.prof_to_utp_email(Planification.first)
	end

	def utp_to_prof_email
		CheckMailer.utp_to_prof_email(Planification.first)
	end

end
