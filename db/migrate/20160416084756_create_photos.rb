class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gallery_id,  null: false, comment: 'Внешний ключ для связи с таблицей галлерей'
      t.string  :link,        null: true,  comment: 'Ссылка на внешний ресурс'

      t.timestamps null: false
    end
  end
end
