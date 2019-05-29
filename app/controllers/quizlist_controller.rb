class QuizlistController < ApplicationController
  before_action :authenticate_user!
  before_action :get_sign_in_user
  
  include HomeHelper
  
  def index
      
    if params[:story_id]
        @story = Story.find(params[:story_id])
        @status = params[:selecting_status]
        @questions = select_question_whose_status_is_(params[:selecting_status],params[:story_id]).page(params[:page]).per(50)
    end
        
    if params[:position] == "favorite"
        favorite =  @current_user.favorites.find_by(question_id: params[:question_id])
        if favorite.present?
            favorite.delete
        else
            @current_user.favorites.build(question_id: params[:question_id]).save
        end
            @question = Question.find(params[:question_id])
    end
    
    respond_to do |format|
        format.html
        format.js
    end
  end
    
  
    def destroy
      question = Question.find(params[:id])
      if question.favorites
        question.favorites.delete_all
      end
      if question.statuses
        question.statuses.delete_all
      end
      redirect_back(fallback_location: root_path)
    end
end
