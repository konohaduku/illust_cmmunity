class CreateIllustComments < ActiveRecord::Migration[6.1]
  def change
    create_table :illust_comments do |t|
      t.text :illust_comment
      t.integer :user_id
      t.integer :illust_id

      t.timestamps
    end
  end
end
