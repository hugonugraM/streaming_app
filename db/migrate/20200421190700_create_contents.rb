class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :plot
      t.integer :number, null: true #it is used just by seasons
      t.string :content_type, limit: 1 #to filter whether content is a movie or a season: 's' for seasons, 'm' for movies

      t.timestamps
    end
  end
end
