class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.text :image, null: false
      t.float :rate, null: false
      t.timestamps
    end
  end
end
