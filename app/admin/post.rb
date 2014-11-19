ActiveAdmin.register Post do
  permit_params :title, :description, :content, :published, :image, :remove_image

  form html: { multipart: true } do |f|
    f.inputs 'Post Details' do
      f.input :title
      f.input :description
      f.input :content
      f.input :published
      f.input :image, required: false, as: :file
      if (f.object.image.present?)
        f.input :remove_image, as: :boolean, required: false, label: 'Remove Image'
      end
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :description
    column :created_at
    column :updated_at
    column :published
    column :image do |post|
      if post.image.present?
        image_tag(post.image.url(:thumb))
      else
        "No Image"
      end
    end
    actions
  end

  show do |post|
    attributes_table do
      row :id
      row :title
      row :description
      row :content do
        markdown(post.content)
      end
      row :created_at
      row :updated_at
      row :published
      if (post.image.present?)
        row :image do
          image_tag(post.image.url(:thumb))
        end
      end
    end
  end
end