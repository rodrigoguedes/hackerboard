class QuestionFilter
  def self.filter(options)
    Question
      .filter_by(options.fetch(:filter, :answered))
      .sort_by_replied_at # .order(created_at: :desc)
      .includes(:user) #Eager load
      .paginate(options[:p])
  end
end