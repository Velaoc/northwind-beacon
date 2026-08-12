class CreateLeads < ActiveRecord::Migration[8.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email, null: false
      t.string :email_normalized, null: false
      t.timestamps
    end
    add_index :leads, :email_normalized, unique: true
  end
end
