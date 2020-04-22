class User < ApplicationRecord
  EMAIL_FORMAT = /\A[+-_0-9a-z.]+@([-a-z0-9.]+)+\.[a-z]{2,4}\z/i

  validates_presence_of :name, :email, :password
  validates_format_of :email, with: EMAIL_FORMAT
  validates_confirmation_of :password
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password
end
