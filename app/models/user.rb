class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :city, presence: true
  has_many :posts
end
