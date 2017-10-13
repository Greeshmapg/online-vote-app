class CreateNominees < ActiveRecord::Migration[5.1]
  def change
    create_table :nominees do |t|
      t.string :name
      t.integer :votes

      t.timestamps
    end
  end
end
