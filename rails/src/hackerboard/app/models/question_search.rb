class QuestionSearch
  def self.search(options)
    Question.search(options[:q]).records
    # @questions = Question.search_paginate(params[:q], params[:p]).records
  end
end