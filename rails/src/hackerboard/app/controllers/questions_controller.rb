class QuestionsController < ApplicationController
  before_action :require_logged_user, only: %i[ new create]

  def index
    @questions = Question
      .order(created_at: :desc)
      .paginate(params[:p])
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
  end

  private
  def question_params
    params
      .require(:question)
      .permit(:title, :content, :category_id)
  end
end