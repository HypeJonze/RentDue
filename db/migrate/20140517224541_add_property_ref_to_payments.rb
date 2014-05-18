class AddPropertyRefToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :property, index: true
  end
end
