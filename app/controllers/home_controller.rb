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
        #ポップアップよりリクエストを受け取り問題を選択する リクエスト ステータスとタイトル、話
        @story = Story.find(params[:story_id])
        @status = params[:status]
        
        
    end
    
    def get_sign_in_user
        #utilize devise helper 
        @current_user = current_user
    end
        
    

end
