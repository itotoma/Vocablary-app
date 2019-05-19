# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  #GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
     super
  end

 # GET /resource/password/edit?reset_password_token=abcdef
  def edit
     @email = params[:email]
     @user = User.find_by(email: params[:email]) 
     #redirect_to new_user_session_path
  end

  # PUT /resource/password
  def update
     flash[:success] = "パスワードを変更しました"
     redirect_to root_path
     super
  end

  protected

  def after_resetting_password_path_for(resource)
     super(resource)
  end

  #The path used after sending reset password instructions
   def after_sending_reset_password_instructions_path_for(resource_name)
     super(resource_name)
   end
   
end
