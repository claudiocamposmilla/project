class CreateResolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :resolutions do |t|
      t.references :ticket, null: false, foreign_key: true
      t.integer :resolved, default: 0
      t.integer :evaluation, null: true
      t.string :resolution_comment

      t.timestamps
    end
  end
end


