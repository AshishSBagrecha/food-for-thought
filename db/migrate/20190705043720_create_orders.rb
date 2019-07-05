class CreateOrders < ActiveRecord::Migration[5.2]
  def up
   create_table :orders do |t|
     t.integer :receiver_user_id
     t.integer :donor_user_id
     t.integer :no_of_meals
     t.integer :event_id
   end
  end
end
