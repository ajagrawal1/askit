class AddApproveToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :approve, :boolean, default: "false"
  end
end
