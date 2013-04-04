class AddQuizzesTagsTable < ActiveRecord::Migration
  def change
    create_table :quizzes_tags, :id=>false do |t|
      t.integer :quiz_id
      t.integer :tag_id
    end
  end
end
