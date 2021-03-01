ActiveAdmin.register User do
  menu priority: 3

  permit_params :email, :encrypted_password, :name, :role, :status

  # customizing the main display 
  index do 
    selectable_column
    column :email
    column :name
    column :role
    column :status
    actions
  end

  # customizing the filters 
  filter :name
  filter :role, :as => :select, :collection => ["beginner", "expert"]
  filter :status, :as => :select, :collection => ["pending", "approve"]
  
  # customizing the view option for users
  show do
    attributes_table do
      row :email
      row :name
      row :role
      row :status
      row :created_at
      row :updated_at
    end
  end
end
