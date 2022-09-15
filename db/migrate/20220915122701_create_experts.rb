class CreateExperts < ActiveRecord::Migration[6.1]
  def change
    create_table :experts do |t|
      t.string :name
      t.string :city
      t.float :score_a
      t.float :score_b
      t.float :score_c
      t.integer :nb_sales

      t.timestamps
    end
  end
end
