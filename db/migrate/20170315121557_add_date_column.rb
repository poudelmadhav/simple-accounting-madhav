class AddDateColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :records, :date, :date
  end
end
