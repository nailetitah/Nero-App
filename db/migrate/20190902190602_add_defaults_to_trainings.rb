class AddDefaultsToTrainings < ActiveRecord::Migration[5.2]
  def up
    change_column_default :trainings, :duration, 172800
    change_column_default :trainings, :price, 790
    change_column_default :trainings, :location, "Paris"
    change_column_default :trainings, :description, "Formation de 2 jours intensifs pour apprendre le Marketing Digital. \n
SEO - Acquisition Payante - Analyse de données." 
  end

  def down
    change_column_default :trainings, :duration, nil
    change_column_default :trainings, :price, nil
    change_column_default :trainings, :location, nil
    change_column_default :trainings, :description, nil
  end
end
