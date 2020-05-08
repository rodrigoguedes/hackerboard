desc "Update column replied_at for question replied"
task :update_question_replied_at => :environment do
  Question.find_each do |question|
    if question.replies_count > 0 && question.replied_at.nil?
      question.touch(:replied_at)
    end
  end
end