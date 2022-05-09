class CreatePurchasePurchasesHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_purchases_histories do |t|

      t.timestamps
    end
  end
end
