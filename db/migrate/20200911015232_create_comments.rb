class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,null: false
      t.references :user_id, null: false, foreign_key: true
      t.references :tweet_id, null: false, foreign_key: true
      t.timestamps
      
    end
  end
end
