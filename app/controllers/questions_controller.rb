class QuestionsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
	def index
		@questions = Question.all
		@list_questions = Question.order('created_at desc')
		@recent_questions = Question.order('total_view desc').limit(5)
	end

	def show
		@question = Question.find(params[:id])
		@question.update_total_view
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