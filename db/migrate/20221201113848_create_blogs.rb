class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.date :published_at
      t.text :content

      t.timestamps
    end
  end
end
