# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for twitter
  def twitter
    callback_for(:twitter)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end
  
  def yahoojp
    callback_for(:yahoojp)
  end
  
  # common callback method
  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      #保存されているかの確認 from_omniauthでfirst_or_createを実行しているためSNS認証ならば全てここへ入る
      sign_in_and_redirect_customize(@user, event: :authentication)
      flash[:success]="ログインに成功しました"
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      #session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      flash[:danger]="ログインに失敗しました"
      redirect_to new_user_registration_url

    end
  end

  def failure
    redirect_to root_path
  end





def sign_in_and_redirect_customize(resource_or_scope, *args)
  options  = args.extract_options!
  scope    = Devise::Mapping.find_scope!(resource_or_scope)
  resource = args.last || resource_or_scope
  sign_in(scope, resource, options)
  redirect_to home_index_path
end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end
  
  

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
