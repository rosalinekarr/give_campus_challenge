class AddMatchIdToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :match_id, :integer
  end
end
