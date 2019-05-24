class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
    #to add an index on the email column of the users table. 
    #The index by itself doesn’t enforce uniqueness, but the option unique: true does.
  end
end
