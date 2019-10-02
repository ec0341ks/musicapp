class Comment < ApplicationRecord
  create_table :comments do |t|
    t.string :content
    t.string :image
    t.references :user, foreign_key: true
    t.timestamps
  end
end
