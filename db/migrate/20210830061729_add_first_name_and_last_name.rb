class AddFirstNameAndLastName < ActiveRecord::Migration[6.1]
  def change
    add_column :managers, :first_name, :string
    add_column :managers, :last_name, :string
    add_reference :managers, :role, foreign_key: true
  end
end
