class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates_presence_of :title, :content, :category, :user
end
