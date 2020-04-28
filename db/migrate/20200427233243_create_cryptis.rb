class CreateCryptis < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptis do |t|
      t.string :symbol
      t.integer.index :user_id
      t.decimal :cost_per
      t.decimal :amount_owned

      t.timestamps
    end
  end
end
