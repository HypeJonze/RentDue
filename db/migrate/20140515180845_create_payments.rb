class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :ip
      t.string :express_token
      t.string :express_payer_id
      t.references :property, index: true

      t.timestamps
    end
  end
end
