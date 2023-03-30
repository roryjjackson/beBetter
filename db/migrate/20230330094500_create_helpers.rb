class CreateHelpers < ActiveRecord::Migration[7.0]
  def change
    create_table :helpers do |t|
      t.string :occupation
      t.text :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
