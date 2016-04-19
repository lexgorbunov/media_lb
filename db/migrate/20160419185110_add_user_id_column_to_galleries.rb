class AddUserIdColumnToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :user_id, :integer, null: true, comment: 'связь с пользователем'
  end
end
