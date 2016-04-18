class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string  :title,         null: true,                   comment: 'Название коллекции'
      t.boolean :is_published,  null: false, default: false,  comment: '1 - Опубликовано'

      t.timestamps null: false
    end
  end
end
