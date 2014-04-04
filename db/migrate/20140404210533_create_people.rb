class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :drinks
      t.text :img_url
      t.boolean :license
    end
  end
end
