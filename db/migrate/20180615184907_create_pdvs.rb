class CreatePdvs < ActiveRecord::Migration[5.2]
  def change
    create_table :pdvs do |t|
      t.string :tradingName
      t.string :ownerName
      t.string :document
      t.json :coverageArea, null: false, default: { }
      t.json :address, null: false, default: {}
    end
  end
end
