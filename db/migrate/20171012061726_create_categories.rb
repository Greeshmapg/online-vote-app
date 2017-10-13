class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :end_date
      t.string :status

      t.timestamps
    end
  end
end
