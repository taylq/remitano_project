class AddYoutubeIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :youtube_id, :integer
  end
end
