class Question < ApplicationRecord
  belongs_to :story
  has_many :statuses
  has_many :users, through: :statuses
  
  
  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      question = Question.new
      question.attributes = row.to_hash.slice(*updatable_attributes)
      question.story_id = parent_id
      question.save
    end
  end
  
  def self.updatable_attributes
    ["question", "answer", "sound_file"]
  end
  
end
