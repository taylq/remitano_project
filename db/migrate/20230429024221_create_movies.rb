class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :description
      t.string :url, null: false
      t.integer :vote_up, default: 0
      t.integer :vote_down, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :rating, null: false

      t.timestamps
    end
  end
end
