class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :shared_on
      t.string :msg_text
      t.string :msg_type
      t.integer :user_id

      t.timestamps
    end
  end
end
