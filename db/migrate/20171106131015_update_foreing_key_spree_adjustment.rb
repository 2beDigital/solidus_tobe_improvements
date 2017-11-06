class UpdateForeingKeySpreeAdjustment < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :spree_adjustments, :spree_orders
    add_foreign_key :spree_adjustments,
                  :spree_orders,
                  name:      'fk_spree_adjustments_order_id', # default is indeterministic
                  column:    :order_id,
                  on_delete: :cascade,  # handled by models
                  on_update: :restrict  # handled by models
  end
end
