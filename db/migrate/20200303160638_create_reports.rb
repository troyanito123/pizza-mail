class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.date :day
      t.datetime :time
      t.string :email
      t.integer :prevalence
      t.integer :status, default: 0
      t.boolean :state, default: false

      t.timestamps
    end
  end
end
