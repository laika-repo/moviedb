class AddUserReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :reviews do |t|
    t.belongs_to :user
      t.belongs_to :movie
      t.integer :stars
      t.text :body
      t.timestamps
    end
  end
end