class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :prototype_id
      t.text :text
      t.references :user,            null: false, foreign_key: true
      t.references :prototype,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
