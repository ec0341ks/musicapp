class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :image
      t.references :user, foreign_key: true
      t.string :music_id
      t.timestamps
    end
  end
end