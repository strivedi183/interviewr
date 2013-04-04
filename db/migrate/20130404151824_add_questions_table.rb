class AddQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :prompt
      t.integer :quiz_id
      t.timestamps
    end
  end
end
