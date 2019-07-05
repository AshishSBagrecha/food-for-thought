class CreateUsers < ActiveRecord::Migration[5.2]
  def up
   create_table :users do |t|
     t.string :first_name
     t.string :last_name
     t.string :location
     t.string :email_id
     t.string :phone_number
     t.string :user_type
     t.string :password
   end
 end
end
