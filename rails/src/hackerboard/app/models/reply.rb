class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true

  after_create :update_replied_at 

  scope :feed, -> {
    limit(10).order(created_at: :desc)
  }

  validates_presence_of :user, :question, :content

  private
  def update_replied_at
    question.touch(:replied_at)
  end
end
