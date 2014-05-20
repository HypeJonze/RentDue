class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :province
      t.string :city
      t.string :postcode
      t.integer :rent
      t.date :utilies
      t.date :due_date
      t.timestamps
    end
  end
end
