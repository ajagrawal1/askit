ActiveAdmin.register Comment do
  menu priority: 6

  permit_params :comment, :user_id, :commentable_type, :commentable_id,:approve

  # customizing the main display 
  index do 
    selectable_column
    column :comment
    column :commentable_type
    column :approve
    actions
  end
  
  # customizing the filters 
  filter :commentable_type
  filter :comment
  filter :user_id
  filter :approve

end
