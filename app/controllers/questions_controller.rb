class QuestionsController < ApplicationController



  def new
    @q = Question.new
  end

  def create
    @q  =  Question.new(question_params)

    if @q.save
      redirect_to questions_path
    else
      render text: "Not Saved!"
    end
  end

  def show
    @q = Question.find params[:id]
  end

  def edit
    @q = Question.find params[:id]
  end

  def show

  end

  def index
    @questions = Question.all
  end


private

  def question_params

    params.require(:question).permit([:title, :body])

    params.require(:question).permit([:title, :body])

  end

end
