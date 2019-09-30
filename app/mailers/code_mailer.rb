class CodeMailer < ApplicationMailer

	def school_code_email(prof, school)
		@prof = prof
		@school = school
		# Asumiendo que sólo hay UTPs en el colegio, y que hay sólo 1	
		@utp = @school.users.where(['role LIKE ?', "%UTP"])[0]

		mail(to: @prof.email, subject: "Jefe UTP desea compartir con ud. datos de escuela " + @school.name)
		
	end

end
