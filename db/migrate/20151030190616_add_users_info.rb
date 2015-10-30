class AddUsersInfo < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :role, null: false, default: "Student"
    end
  end
end
