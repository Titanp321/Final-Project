class CreateFtdebts < ActiveRecord::Migration
  def change
    create_table :ftdebts do |t|
      t.string :accountname
      t.decimal :debt_apr
      t.decimal :debt_balance
      t.integer :debt_term
      t.integer :user_id

      t.timestamps

    end
  end
end
