class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.decimal :amount, precision: 9, scale: 2, null: false
      t.string :name

      t.timestamps
    end
  end
end
