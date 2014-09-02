class VotesController < ApplicationController

  before_filter :authorize, only: [:new, :edit, :update, :destroy]

  def new
    @vote = Vote.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response_id = params[:response_id]
    @user_id = session[:user_id]
    @vote = Vote.create({response_id: @response_id, user_id: @user_id})
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
  end
  end
end
