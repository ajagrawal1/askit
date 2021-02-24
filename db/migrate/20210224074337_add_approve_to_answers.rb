class AddApproveToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :approve, :boolean, default: "false"
  end
end
