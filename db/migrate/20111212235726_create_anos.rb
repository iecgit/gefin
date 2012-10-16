class CreateAnos < ActiveRecord::Migration
  def change
    create_table :anos do |t|
      t.integer :ano

      t.timestamps
    end
  end
end
