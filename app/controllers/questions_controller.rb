class QuestionsController < ApplicationController
  #skip_before_action :require_login, only: %i[index]
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :authorization_user, only: [:update, :edit, :destroy]

  # GET /questions or /questions.json
  def index
    @questions = Question.order(created_at: :desc).page params[:page]
  end

  # GET /questions/1 or /questions/1.json
  def show; 
    @answers = @question.answers.order(created_at: :desc).page params[:page]
    @answer = @question.answers.build
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions or /questions.json
  def create
    @question = Question.new(**question_params, user_id: current_user.id)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: t('oneq.suc_created') }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: t('oneq.suc_updated') }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url } #, notice: t('oneq.suc_deleted') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:head, :text)
    end

    def authorization_user
      return if current_user == @question.user
      flash[:warning] = 'You are not author of this question'

      redirect_to root_path
    end
end
