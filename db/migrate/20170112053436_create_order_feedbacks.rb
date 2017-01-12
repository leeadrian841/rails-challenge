class CreateOrderFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :order_feedbacks do |t|
      t.integer :order_id
      t.text :comment

      t.timestamps
    end
  end
end
