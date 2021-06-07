ActiveAdmin.register Text do
  permit_params :genre, :title, :content

  index do
    selectable_column
    id_column
    column :genre, :text, &:genre_i18n
    column :created_at
    column :updated_at
    actions
  end
end
