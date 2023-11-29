class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.boolean :published, default: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
