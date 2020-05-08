class QuestionsController < ApplicationController
  before_action :require_logged_user, only: %i[ new create]

  def index
    @questions = QuestionFilter.filter(params)
  end

  def new
    @question = Question.new

    render layout:"window"
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to question_path(@question),
        notice: t("flash.questions.create.notice")
    else
      # puts @question.
      render :new, layout: "window"
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.hit!
    
    @reply = Reply.new
    @replies = @question.replies.includes(:user)
  end

  def feed
    @question = Question.find(params[:id])
    @replies = @question
      .replies
      .feed
      .includes(:user)
  end

  private
  def question_params
    params
      .require(:question)
      .permit(:title, :content, :category_id)
  end
end