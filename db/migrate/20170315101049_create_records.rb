class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
    	t.string :title
    	t.integer :amount
    	t.timestamps :date
    end
  end
end
