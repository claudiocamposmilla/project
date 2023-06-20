class ChangeDefaultResolvedValueInResolutions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :resolutions, :resolved, 1
  end
end
