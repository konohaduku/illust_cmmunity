class CreateIllustImages < ActiveRecord::Migration[6.1]
  def change
    create_table :illust_images do |t|
      t.integer :user_id
      t.integer :illust_id

      t.timestamps
    end
  end
end
