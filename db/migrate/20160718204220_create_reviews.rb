class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.text :text
      t.integer :rating_out_of_ten

      t.timestamps
    end

    add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id"
    add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  end
end
