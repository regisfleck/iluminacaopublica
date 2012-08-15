# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  nome            :string(255)
#  login           :string(255)
#  email           :string(255)
#  matricula       :integer
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :matricula, :nome, :login, :email, :password, :password_confirmation
  has_secure_password

  before_save { self.email.downcase! }
  before_save { self.login.downcase! }

  validates :nome, presence: true, length: { maximum: 50 }
  validates :matricula, presence: true, uniqueness: true
  validates :login, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
