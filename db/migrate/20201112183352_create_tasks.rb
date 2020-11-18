class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string  :name
      t.integer :position
      t.boolean :active,          default: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
