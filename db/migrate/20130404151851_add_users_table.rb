class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :password_digest
      t.string  :address
      t.string  :phone
      t.string  :image
      t.string  :occupation
      t.float   :lat
      t.float   :long
      t.decimal :balance
      t.bool    :is_house
      t.string  :customer_id
      t.timestamps
    end
  end
end
