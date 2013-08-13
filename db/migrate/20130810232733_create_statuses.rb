class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.text :supplication

      t.timestamps
    end
  end
end
