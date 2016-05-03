class CreateTrainingSets < ActiveRecord::Migration
  def change
    create_table :training_sets do |t|
      t.string :text
      t.integer :label

      t.timestamps null: false
    end
  end
end
