class AddTypeAndDueDateToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :type, :string
    add_column :notes, :due_date, :date

    add_index :notes, :type
  end
end
