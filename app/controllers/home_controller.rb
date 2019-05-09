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
        @story = Story.group(:title)
    end
    
    def question
        
        #最初はURLからストーリーとステータス情報を送る
        if params[:status] == "unclear"
            if params[:story_id]
                @story = Story.find(params[:story_id])
                @question = @story.questions[0]
                @status = params[:status]
            end
        end
        
        if params[:status] == "collect"
            if params[:story_id]
                @story = Story.find(params[:story_id])
                @question = @story.questions[0]
                @status = params[:status]
            end
        end
        
        if params[:status] == "incollect"
            if params[:story_id]
                @story = Story.find(params[:story_id])
                @question = @story.questions[0] #status incollect のみ
                @status = params[:status]
            end
        end
        
        if params[:status] == "Like"
            if params[:story_id]
                @story = Story.find(params[:story_id])
                @question = @story.questions[0] #Likeのみ
                @status = params[:status]
            end
        end
        
        if params[:status] == "all"
            if params[:story_id]
                @story = Story.find(params[:story_id])
                @question = @story.questions[0]
                @status = params[:status]
            end
        end
        
        
        transition_from_question_to_answer
        transition_from_answer_to_question
            
        respond_to do |format|
            format.html
            format.js
        end
    end
    
   
   
    private
    
   
    def transition_from_question_to_answer
        
        if params[:position] == "question_page"     
            @this_question_id = params[:this_question_id]
            #current_userとquestionのStatusがすでに作成されている場合 -> @this_status は Update
            #current_userとquestionのStatusがすでに作成されていない場合 -> @this_status は build
            @answer = Question.find(@this_question_id).answer
            @aim = 1
        end
        
    end
    
    def transition_from_answer_to_question
    
        if params[:position] == "answer_page"     
            given_status = params[:status]
            given_question_id = params[:this_question_id]
            @this_story = Question.find(given_question_id).story
            
            for question in @this_story.questions
                if question.id > given_question_id.to_i
                    @next_question = question.question
                    @next_question_id = question.id
                    break
                end
            end
            
            target = current_user.statuses.where(question_id: given_question_id)
            if target.present?
                target.update(status: given_status)
            else
                Status.create(status: given_status, question_id: given_question_id, user_id: current_user.id)
            end
            @aim = 0
            #問題を入れ替える
        end
    end
    
    
        
    

end
