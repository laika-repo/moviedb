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


# class CreateAppointments < ActiveRecord::Migration[6.0]
#   def change
#     create_table :physicians do |t|
#       t.string :name
#       t.timestamps
#     end

#     create_table :patients do |t|
#       t.string :name
#       t.timestamps
#     end

#     create_table :appointments do |t|
#       t.belongs_to :physician
#       t.belongs_to :patient
#       t.datetime :appointment_date
#       t.timestamps
#     end
#   end
# end