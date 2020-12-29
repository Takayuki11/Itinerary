class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :prefecture
      t.string :address
      t.string :spot
      t.string :detail
      t.float :rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
