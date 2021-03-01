ActiveAdmin.register Question do
  menu priority: 4
  
  permit_params :title, :description, :image, :approve, :user_id

  # customizing the main display 
  index do 
    selectable_column
    column :title
    column :user
    column :approve
    actions
  end

  # customizing the filters 
  filter :user_id
  filter :title
  filter :approve

  # customizing the view option to view img instead fo link
  show do
    attributes_table do
      row :title
      row :description
      row :approve
      row :user
      row :created_at
      row :updated_at
      row :image do |question|
        image_tag question.image.url if question.image?
      end
    end
  end

end
