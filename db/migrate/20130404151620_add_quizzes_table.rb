class AddQuizzesTable < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string  :name
      t.bool    :is_public
      t.decimal :cost, :default => 0
      t.string  :code
      t.integer :num_pass
      t.integer :user_id
    end
  end
end
