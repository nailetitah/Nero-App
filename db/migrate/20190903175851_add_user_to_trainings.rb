class AddUserToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :training, foreign_key: true
  end
end
