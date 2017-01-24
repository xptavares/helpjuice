class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
      t.index :title, unique: true
    end
  end
end
