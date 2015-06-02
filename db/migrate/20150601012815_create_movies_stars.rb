class CreateMoviesStars < ActiveRecord::Migration
  def change
    create_table :movies_stars, id: false do |t|
      t.references :movie, :star
    end
  end
end
