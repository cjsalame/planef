# Preview all emails at http://localhost:3000/rails/mailers/code_mailer
class CodeMailerPreview < ActionMailer::Preview

	def school_code_email
		CodeMailer.school_code_email(User.first, School.first)
	end
end
