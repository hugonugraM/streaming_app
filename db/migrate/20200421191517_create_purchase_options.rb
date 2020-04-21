class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.string :quality
      t.float :price
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
