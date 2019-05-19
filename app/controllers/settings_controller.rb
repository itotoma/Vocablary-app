class SettingsController < ApplicationController
    
    def password
        @email = params[:email]
        user = User.find_by(email: params[:email])
        #これを文字列にせねばならない
        password = params[:r_password]
        if params[:r_password] != params[:r_password_confirmation]
           
        end
            
        user.password = password
        user.password_confirmation = password
        user.save
        #devise helperメソッド reset_password
        flash[:success] = "パスワードを変更"
        
        redirect_to new_user_session_path
    end
    
end
