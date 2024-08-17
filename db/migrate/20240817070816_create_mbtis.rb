class CreateMbtis < ActiveRecord::Migration[7.1]
  def change
    create_table :mbtis do |t|
      t.string :name

      t.timestamps
    end
  end
end
