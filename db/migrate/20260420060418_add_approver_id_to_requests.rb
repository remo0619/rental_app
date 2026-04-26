class AddApproverIdToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :approver_id, :integer
  end
end
