class ChangeStatusDefaultOnDevices < ActiveRecord::Migration[7.2]
  def change
    change_column_default :devices, :status, from: nil, to: 0
    change_column_null :devices, :status, false, 0
  end
end
