class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :data

      t.timestamps
    end
  end
end
