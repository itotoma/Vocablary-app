class FavoriteController < ApplicationController
    def create
        question = Question.find(params[question_id])
        current_user.favorites.build(question_id: question.id)
    
    end
end
