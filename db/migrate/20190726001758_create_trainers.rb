class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.text :description
      t.integer :price
      t.string :area

      t.timestamps
    end
  end
end
