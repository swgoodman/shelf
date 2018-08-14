class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :category
      t.integer :user_id
    end
  end
end
