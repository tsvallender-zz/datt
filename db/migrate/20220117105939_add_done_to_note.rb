class AddDoneToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :done, :boolean, default: nil

    add_index :notes, :done
  end
end
