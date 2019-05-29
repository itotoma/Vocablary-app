module QuizlistHelper
 
    def select_question_whose_status_is_(request_status,story)
        whole_questions = []
        if request_status == "all"
            whole_questions = Question.all.where(story_id: story)
        elsif request_status == "favorite"
            whole_questions = @current_user.favorite_questions.where(story_id: story)
        elsif request_status == "unclear"
            
            whole_questions = @current_user.questions.where(story_id: story)
            whole_questions = Question.all.where(story_id: story)
            already_answered_question_ids = @current_user.questions.where(story_id: story).ids
            all_question = Question.all.where(story_id: story)
            if already_answered_question_ids.present?
                whole_questions = all_question.where.not('id IN (?)',already_answered_question_ids)
            else
                whole_questions = all_question
            end
        else
            statuses_which_has_selected_status = @current_user.statuses.where(status: request_status).where('question_id IN (?)',Story.find(story).questions.ids)
            statuses_which_has_selected_status.each do |status|
                whole_questions.push(Question.find(status.question_id))
            end
        end
        return whole_questions
    end
    
    def status(question)
        tmp = question.statuses.find_by(user_id: @current_user.id)
        if tmp.present?
            status = tmp.status
        else
            status = "hoge"
        end
        return status
    end
end
