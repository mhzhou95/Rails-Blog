class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.string :username
    	t.string :content
    	t.integer :blog_id
      t.timestamps
    end
  end
end
