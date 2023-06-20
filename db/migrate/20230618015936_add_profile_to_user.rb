class AddProfileToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.integer :profile, null: false, default: 0
      t.string "name" , null: false
      t.string "lastname", null: false
    end
  end

end
