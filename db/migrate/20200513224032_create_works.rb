class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :category
      t.string :creator
      t.string :year
      t.string :description

      t.timestamps
    end
  end
end
