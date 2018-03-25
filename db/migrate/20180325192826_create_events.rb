class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :name
      t.references :registered_application, index:true, foreign_key: true

      t.timestamps
    end
  end
end
