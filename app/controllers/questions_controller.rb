class QuestionsController < ApplicationController
	before_filter :authenticate_user!, exept: [:index, :show]
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
		@user = current_user
		@question = @user.questions.build(params[:question])
		if @question.save
			redirect_to question_path(@question)
		else
			render :new
	end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update_attributes(params[:question])
			redirect_to question_path(@question)
		else
			render :edit
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

end