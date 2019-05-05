class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title, presence: true
      t.integer :number

      t.timestamps
    end
  end
end
