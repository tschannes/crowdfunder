class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.integer :amount

      t.timestamps
    end
  end
end
