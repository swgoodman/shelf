class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :library_id
      t.string :name
      t.string :author
      t.string :format
      t.string :status
      t.string :note
      t.string :category
      t.timestamp :date_created, DEFAULT: Time.now
    end
  end
end
