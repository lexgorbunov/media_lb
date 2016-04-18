class Mediafile < ActiveRecord::Migration
  def change
    create_table :media_files do |t|
      t.integer :media_file_id,     null: false,  comment: 'Идентификатор материала из связанной модели'
      t.string  :class_name,        null: false,  comment: 'Название класса обработчика файла'
      t.string  :file_file_path,    null: true,   comment: 'Путь к файлу'
      t.string  :file_file_name,    null: true,   comment: 'Имя файла (paperclip)'
      t.string  :file_content_type, null: true,   comment: 'MEDIA-тип файла (paperclip)'
      t.string  :file_file_size,    null: true,   comment: 'Размер файла в байтах (paperclip)'

      t.timestamps null: false
    end
  end
end
