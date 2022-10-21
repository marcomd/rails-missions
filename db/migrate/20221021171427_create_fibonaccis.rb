class CreateFibonaccis < ActiveRecord::Migration[7.0]
  def change
    create_table :fibonaccis do |t|
      t.integer :value
      t.integer :result, limit: 8
      t.decimal :runtime
      t.time :created_at
    end
  end
end
