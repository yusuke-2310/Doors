class CreateMyPages < ActiveRecord::Migration[6.1]
  def change
    create_table :my_pages do |t|

      t.timestamps
    end
  end
end
