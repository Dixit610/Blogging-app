class Department < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :blogs, dependent: :destroy

	before_save :capitalize

	def capitalize
		self.department_name = self.department_name.upcase
	end
end
