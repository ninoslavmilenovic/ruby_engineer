ActiveAdmin.register Post do
  permit_params :title, :description, :content, :published, :image, :remove_image

  form html: { multipart: true } do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :description
      f.input :content
      f.input :published
      f.input :image, required: false, as: :file, hint: "Image will be scaled to #{Post::IMAGE_MEDIUM_SIZE} and #{Post::IMAGE_THUMB_SIZE} respectively."
      if (f.object.image.present?)
        f.input :remove_image, as: :boolean, required: false, label: "Remove Image"
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
        image_tag(post.image.url(:medium), width: 225)
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
          image_tag(post.image.url(:medium), width: 340)
        end
      end
    end
  end
end
