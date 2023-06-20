class AddUserBodyToResolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :resolutions, :user_body, :string
  end
end
