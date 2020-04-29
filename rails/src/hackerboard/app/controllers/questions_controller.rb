class QuestionsController < ApplicationController
  before_action :require_logged_user, only: %i[ new create]

  def index
  end

  def new
  end
end