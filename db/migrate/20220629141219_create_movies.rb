class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :year
      t.integer :duration
      t.string :genre

      t.timestamps
    end
  end
end
