class AddDefaultTrainingToUser < ActiveRecord::Migration[5.2]
  def up
    change_column_default :users, :training_id, 1
  end

  def down
    change_column_default :users, :training_id, nil
  end
end
