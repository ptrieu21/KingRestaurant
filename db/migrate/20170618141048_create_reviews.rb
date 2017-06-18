class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :content
      t.references :food_item, foreign_key: true

      t.timestamps
    end
  end
end
