class Question < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks # or (Asynchronous Callbacks) using https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model#asynchronous-callbacks

  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :title, analyzer: 'snowball', boost: 100
  #     indexes :content, analyzer: 'snowball'
  #   end
  # end

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

  # https://github.com/elastic/elasticsearch-rails/issues/338#issuecomment-138483198
  # scope :search_paginate, -> (query, page = 1, per_page = 100) {
  #   page ||= 1
  #   search(
  #     query: {
  #       query_string: {
  #         query: query
  #       },
  #       size: per_page,
  #       from: (page.to_i - 1) * per_page
  #     }
  #   )
  # }

  validates_presence_of :title, :content, :category, :user

  def hit!
    increment! :hits_count
  end
end
