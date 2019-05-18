class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :get_sign_in_user
    
    def index
    end
    
    def title_list
        if params[:url].to_i == 1
            @nav_title = "学習する"
        else
            @nav_title = "一覧を見る"
        end
         @title = Story.group(:title).count.keys
    
    end
    
    def question

    ### Initialize process
        if params[:story_id]
            @question = select_question_whose_status_is_(params[:selecting_status],params[:story_id])[0]
            @story = Story.find(params[:story_id])
            @status = params[:selecting_status]
        end
        
        
    ### Ajax Process
        if params[:position] == "favorite"
            favorite =  @current_user.favorites.find_by(question_id: params[:question_id])
            if favorite.present?
                favorite.delete
            else
                @current_user.favorites.build(question_id: params[:question_id]).save
            end
            @question = Question.find(params[:question_id])
            @aim = 3
        end
        
        
        if params[:position] == "question_page"     
            transition_from_question_to_answer
        end
        
        if params[:position] == "answer_page"     
            transition_from_answer_to_question
        end
            
        respond_to do |format|
            format.html
            format.js
        end
    end
    
   
   
    private
    
    def select_question_whose_status_is_(request_status,story)
        whole_questions = []
        if request_status == "all"
            whole_questions = Question.all.where(story_id: story)
        elsif request_status == "favorite"
            whole_questions = @current_user.favorite_questions.where(story_id: story)
        elsif request_status == 'unclear'
            already_answered_question_ids = @current_user.questions.where(story_id: story).ids
            all_question = Question.all.where(story_id: story)
            whole_questions = all_question.where.not('id IN (?)',already_answered_question_ids)
        else
            question_ids_which_has_selected_status = @current_user.statuses.where(status: request_status).ids
            whole_questions = Story.find(story).questions.where('id IN (?)',question_ids_which_has_selected_status)
        end
        return whole_questions
    end
   
    def transition_from_question_to_answer
        @status = "all"
        @question = Question.find(params[:this_question_id])
        @aim = 1
    end
    
    def transition_from_answer_to_question
        story = Question.find(params[:this_question_id]).story
        @question = select_question_whose_status_is_(params[:selecting_status], story.id).where('id > ?', params[:this_question_id]).first
        request_status = current_user.statuses.where(question_id: params[:this_question_id]).first_or_create
        request_status.update(status: params[:request_status])
        if @question.present?
            @aim = 0
        else
            @aim = 2
        end
    end

end
