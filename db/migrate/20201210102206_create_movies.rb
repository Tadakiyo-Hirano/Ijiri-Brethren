class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :thumbnail_url
      t.string :youtube_mid
      t.string :youtube_url
      t.string :author_name
      t.integer :category, defauit: 0

      t.timestamps
    end
  end
end
