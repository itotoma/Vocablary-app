class CreatePlayinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :playinfos do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
