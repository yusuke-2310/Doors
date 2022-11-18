class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      
      t.references :user, foreign_key: true,  null: false
      
      t.string :name, null: false
      t.string :overview, null: false
      t.timestamps
    end
  end
end
