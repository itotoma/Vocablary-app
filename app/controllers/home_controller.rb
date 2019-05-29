class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :get_sign_in_user
    
    include HomeHelper
    
    
    def index
    end
    
    
    def title_list
        if params[:req] == "learn"
            @nav_title = "学習する"
        else
            @nav_title = "一覧を見る"
        end
        @title = Story.group(:title).count.keys
    end
    
    def question

    ### Initialize process
        if params[:story_id]
            #CAUTION index starts from 0, however it will be described as 1 in view
            @index = 0
            @question = select_question_whose_status_is_(params[:selecting_status],params[:story_id])[@index]
            if @question.present?
                @total = select_question_whose_status_is_(params[:selecting_status],params[:story_id]).count
            else
                @total = "--"
                @index = -1
            end
            @story = Story.find(params[:story_id])
            @status = params[:selecting_status]
        end

    ### Ajax Process
        if params[:position] == "question_page"     
            transition_from_question_to_answer
        end
        
        if params[:position] == "answer_page"     
            transition_from_answer_to_question
        end
        
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
            
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def destroy
        story = Story.find(params[:id])
        story.questions.each do |question|
            if question.favorites
                question.favorites.delete_all
            end
            if question.statuses
                question.statuses.delete_all
            end
        end
        story.questions.delete_all
        story.destroy
        redirect_back(fallback_location: root_path)
    end
    
   
   
    private
    
   
    def transition_from_question_to_answer
        @selecting_status = params[:selecting_sta]
        @question = Question.find(params[:this_question_id])
        @index = params[:ind]
        @total = params[:total]
        @aim = 1
    end
    
    def transition_from_answer_to_question
        story = Question.find(params[:this_question_id]).story
        @selecting_status = params[:selecting_sta]
        @index = params[:ind].to_i + 1
        @question = select_question_whose_status_is_(params[:selecting_sta], story.id)[@index]
        @total = params[:total]
        request_status = current_user.statuses.where(question_id: params[:this_question_id]).first_or_create
        request_status.update(status: params[:request_status])
        
        if @index == @total.to_i
            @aim = 2
            #Javascriptでは条件分岐の条件外スコープであってもnillであることは許されない。
            #そのため偽オブジェクト(使わないオブジェクト)@questionを生成
            @question = Question.first
        elsif @question.present?
             @aim = 0
        else
            @aim = 2
        end
    end

end
