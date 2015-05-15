class Interest < ActiveRecord::Base
	belongs_to :user
	validates :interest, :presence => true
	

end