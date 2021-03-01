ActiveAdmin.register Answer do
  menu priority: 5

  permit_params :answer, :question_id, :user_id, :approve
 
  # customizing the main display 
  index do 
    selectable_column
    column :answer
    column :question
    column :user
    column :approve
    actions
  end

  # customizing the filters 
  filter :question,:as => :select
  filter :user,:as => :select
  filter :answer
  filter :approve

end
