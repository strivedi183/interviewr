class AddHasStartedColumnToResultsTable < ActiveRecord::Migration
  def change
    add_column :results, :has_started, :boolean, :default=> false
  end
end
