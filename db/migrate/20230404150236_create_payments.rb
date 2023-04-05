class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
