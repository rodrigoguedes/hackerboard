class Question < ApplicationRecord
  belongs_to :category, counter_cache: true
  belongs_to :user
  has_many :replies

  scope :sort_by_replied_at, -> {
    order("COALESCE(replied_at, created_at) DESC")
  }

  scope :filter_by, -> filter {
    case filter.to_s
    when "unanswered"
      where(replied_at: nil)
    when "answered"
      all
    else
      raise "invalid filter name"
    end
  }

  validates_presence_of :title, :content, :category, :user

  def hit!
    increment! :hits_count
  end
end
