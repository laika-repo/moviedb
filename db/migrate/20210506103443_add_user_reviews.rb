class AddUserReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :movie
      t.belongs_to :review
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :stars
      t.text :body
      t.timestamps
    end
  end
end