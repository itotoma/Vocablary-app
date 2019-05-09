class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question, presence: true
      t.string :answer, presence: true
      t.string :sound_file
      t.references :story, foreign_key: true
      
      t.timestamps
    end
  end
end
