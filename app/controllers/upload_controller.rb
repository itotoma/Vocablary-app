class UploadController < ApplicationController
  before_action :authenticate_user!
  before_action :get_sign_in_user
  
  def index
    unless current_user.email == "test@gmail.com"
      redirect_to home_index_path
    end
  end
  
  def import
    
    story = Story.where(title: params[:title], number: params[:number]).first_or_create
      #Question.import(file: params[:file].read)
    data1 = params[:file].read.split("\r\n")
    message="クイズを追加しました"
    data1.each do |data2|
      if data2 == data1[0]
          header = data2.split(",")
        unless (header[0] == "ID") && (header[1] == "Question") && (header[2] == "Answer") && (header[3] == "Sound_file")
          message="CSVのフォーマットを確認してください"
          break
        end
      elsif data2.split(",")[1].present? && data2.split(",")[2].present? && data2.split(",")[3].present?
        body = data2.split(",")
        Question.create(question: body[1], answer: body[2], sound_file: body[3], story_id: story.id)
      else
        message="カラの行は無視されました。"
      end
    end
    redirect_to upload_index_path, notice: "#{message}"
  end
end
