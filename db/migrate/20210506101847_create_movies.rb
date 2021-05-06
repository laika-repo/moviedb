class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.integer :year
      t.string :location
      t.string :country

      t.timestamps
    end
  end
end
