class CreateTokimons < ActiveRecord::Migration[5.0]
  def change
    create_table :tokimons do |t|
      t.string :name
      t.float :weight
      t.float :height
      t.float :defense
      t.float :health
      t.float :fly
      t.float :fight
      t.float :fire
      t.float :water
      t.float :electric
      t.float :ice
      t.float :psychic
      t.float :total

      t.timestamps
    end
  end
end
