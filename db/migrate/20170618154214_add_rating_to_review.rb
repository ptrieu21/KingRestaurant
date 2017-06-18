class AddRatingToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rate, :decimal
  end
end
