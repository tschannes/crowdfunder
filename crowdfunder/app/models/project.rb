class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :pledges
  
  #paginates_per 8

  mount_uploader :image, ImageUploader

end
