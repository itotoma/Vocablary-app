class UploadController < ApplicationController
  before_action :authenticate_user!
  before_action :get_sign_in_user
  def index
  end
  
  def import
    
    story = Story.where(title: params[:title], number: params[:number]).first_or_create
    #Question.import(file: params[:file].read)
    data1 = params[:file].read.split("\r\n")
    data1.each do |data2|
      # data[0] is header
      unless data2 == data1[0]
        body = data2.split(",")
        Question.create(question: body[0], answer: body[1], sound_file: body[2], story_id: story.id)
      end
    end
    #CSVは保存しないので、文字列検索で追加
    redirect_to upload_index_path, notice: "商品を追加しました。"
  end
  
end
