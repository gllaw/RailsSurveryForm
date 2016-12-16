class Survey < ActiveRecord::Base
  validates :name, :language, :location, :comment, presence: true

  before_save do 
  	self.name.capitalize!
  end

end
