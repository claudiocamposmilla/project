class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.date :claim_date
      t.date :due_date
      t.date :incident_date
      t.string :summary
      t.string :description
      t.integer :priority, default: 1
      t.integer :status, default: 1
      t.timestamps null: false
    end
  end
end

