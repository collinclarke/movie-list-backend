class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
