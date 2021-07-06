class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_id
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
