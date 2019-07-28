class RemoveFirstNameLastNamePasswordDigestEmailFromTrainers < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainers, :first_name
    remove_column :trainers, :last_name
    remove_column :trainers, :password_digest
    remove_column :trainers, :email
  end
end
