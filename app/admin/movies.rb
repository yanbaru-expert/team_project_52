ActiveAdmin.register Movie do
  permit_params :genre, :title, :url

  index do
    selectable_column
    id_column
    column :genre, :movie, &:genre_i18n
    column :created_at
    column :updated_at
    actions
  end
end
