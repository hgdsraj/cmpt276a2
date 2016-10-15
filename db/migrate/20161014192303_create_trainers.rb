class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.integer :level

      t.timestamps
    end
  end
end