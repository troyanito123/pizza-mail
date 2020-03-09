class CreateReportDays < ActiveRecord::Migration[6.0]
  def change
    create_table :report_days do |t|
      t.references :report, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
