class RepliesController  < ApplicationController
  before_action :require_logged_user

  def create
    @question = Question.find(params[:question_id])
    @reply = current_user.replies.build(
      question: @question,
      content: reply_params[:content]
    )

    if @reply.save
      redirect_to question_path(@question),
        notice: t("flash.replies.create.notice")
    else
      redirect_to question_path(@question),
        alert: @reply.errors.full_messages.join(", ")
    end
  end

  private
  def reply_params
    params
      .require(:reply)
      .permit(:content)
  end
end