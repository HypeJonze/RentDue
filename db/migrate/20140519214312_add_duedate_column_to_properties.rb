class AddDuedateColumnToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :due_date, :date
  end
end
