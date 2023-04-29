class RemoveConstraintUserTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, true
    change_column_null :users, :encrypted_password, true
    change_column_null :users, :created_at, true
    change_column_null :users, :updated_at, true
    change_column_null :ratings, :user_id, true
    change_column_null :ratings, :movie_id, true
    change_column_null :movies, :title, true
    change_column_null :movies, :url, true
    change_column_null :movies, :user_id, true
  end
end
