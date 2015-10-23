class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Your question was saved."
      redirect_to @question
    else
      flash[:error] = "Sorry. There was a problem saving your question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Your question has been updated"
      redirect_to @question
    else
      flash[:error] = "Sorry. There was a problem updating your question. Please try again."
      render :edit
    end
  end
end
