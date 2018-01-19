class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string  :type,    null: false
      t.decimal :maximum, precision: 9, scale: 2, null: false

      t.timestamps
    end
  end
end
