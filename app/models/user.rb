class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :statuses
  has_many :questions, through: :statuses
  has_many :favorites
  has_many :favorite_questions, through: :favorites, :source => 'question'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  def self.from_omniauth(auth)
    #Method.where(parameter).firsr_or_create 
      #where句の条件に合致したレコードが存在すればそれを返す。なければその条件で新規作成しそのレコードを返す。
    self.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      print("AUTH=")
      user.email = auth.info.email
      #Devise.friendly_token[0,20] 
        #20文字でランダムな文字列のパスワードを作成する. https://www.rubydoc.info/github/plataformatec/devise/master/Devise.friendly_token
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  
end
