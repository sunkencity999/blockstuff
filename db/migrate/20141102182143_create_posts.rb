class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :selection

      t.timestamps
    end
  end
end
