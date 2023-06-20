class AddTagsToTicket < ActiveRecord::Migration[7.0]
  def change
    change_table :tickets do |t|
      t.string "tags" , null: true
      
    end
  end
end
