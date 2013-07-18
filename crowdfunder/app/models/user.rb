class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  
  has_many :projects
end
