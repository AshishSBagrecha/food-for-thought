class CreateEvents < ActiveRecord::Migration[5.2]
  def up
   create_table :events do |t|
	   t.string :location
	   t.integer :available_meals
	   t.integer :phone_number
	   t.string :email_id
	   t.integer :donor_user_id
	   t.string :event_code
	   t.string :status
   end
 end
end
