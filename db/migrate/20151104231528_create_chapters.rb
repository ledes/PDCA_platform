class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chapter_name
      t.string :body, null: false
      t.belongs_to :lesson, null: false
    end
  end
end
