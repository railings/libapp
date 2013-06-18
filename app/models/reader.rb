class Reader < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :email, email: true
  validates :password, presence: true
  validates :password, confirmation: true

  attr_accessor :password, :password_confirmation

end