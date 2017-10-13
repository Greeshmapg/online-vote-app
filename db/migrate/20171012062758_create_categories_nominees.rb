class CreateCategoriesNominees < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_nominees do |t|
       t.integer :category_id
      t.integer :nominee_id
    end
  end
end
