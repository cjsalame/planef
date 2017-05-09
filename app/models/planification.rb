class Planification < ApplicationRecord
	has_many :lectures

	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
		self.rating ||= 0
		self.downloads ||= 0
	end

end
