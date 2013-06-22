class Reader < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, email: true
end