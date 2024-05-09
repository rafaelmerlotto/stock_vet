class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :note
      t.integer :quantity

      t.timestamps
    end
  end
end
