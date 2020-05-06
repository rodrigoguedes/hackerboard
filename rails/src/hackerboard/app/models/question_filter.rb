class QuestionFilter
  def self.filter(options)
    Question
      .order(created_at: :desc)
      .includes(:user) #Eager load
      .paginate(options[:p])
  end
end