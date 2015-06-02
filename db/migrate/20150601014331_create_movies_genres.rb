class CreateMoviesGenres < ActiveRecord::Migration
  def change
    create_table :genres_movies, id: false do |t|
      t.references :genre, :movie
    end
  end
end
