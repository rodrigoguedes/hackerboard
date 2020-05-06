class User < ApplicationRecord
  EMAIL_FORMAT = /\A[+-_0-9a-z.]+@([-a-z0-9.]+)+\.[a-z]{2,4}\z/i

  validates_presence_of :name, :email
  validates_format_of :email, with: EMAIL_FORMAT
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password

  has_many :questions
  has_many :replies
end
