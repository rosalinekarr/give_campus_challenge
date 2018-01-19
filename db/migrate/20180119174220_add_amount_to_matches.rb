class AddAmountToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :amount, :decimal, precision: 9, scale: 2
  end
end
