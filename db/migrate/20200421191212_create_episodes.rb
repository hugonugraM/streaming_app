class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.integer :number
      t.belongs_to :season, foreign_key: { to_table: :contents }, null: false

      t.timestamps
    end
  end
end
