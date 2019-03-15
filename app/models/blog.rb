class Blog < ApplicationRecord
	 has_one_attached :blog_image
	 belongs_to :user
	 has_many :comments, dependent: :destroy
	 has_many :likes, dependent: :destroy
	  LIST = Department.all.collect {|c| [ c.department_name, c.id ]}
	 before_save :title_capital

	  def title_capital
	    self.title.capitalize
	  end
end
