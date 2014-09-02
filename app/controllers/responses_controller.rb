class ResponsesController < ApplicationController

  before_filter :authorize, only: [:new, :edit, :update, :destroy]

  def index
    @responses = Response.all
  end

  def new
    @question = Question.find(params[:question_id])
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    @question = Question.find(params[:question_id])
    if @response.save
      @question.responses << @response
      redirect_to question_path(@question), notice: "Response created."
    else
      redirect_to question_path(@question), alert: "Response cannot be blank."
    end
  end

  def update
    @response = Response.find(response_params)
    if @response.update(params[:response])
      redirect_to questions_path, notice: "Response updated."
    else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    redirect_to questions_path, notice: "Response deleted."
  end

  private
  def response_params
    params.require(:response).permit(:response, :user_id)
  end
end
