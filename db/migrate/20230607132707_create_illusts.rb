class CreateIllusts < ActiveRecord::Migration[6.1]
  def change
    create_table :illusts do |t|
      t.string :illust_name
      t.text :illust_body
      t.integer :user_id
      t.boolean :is_active, null: false
      t.integer :taggings_count
      
      t.timestamps
    end
  end
end
