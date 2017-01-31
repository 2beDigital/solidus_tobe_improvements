Spree::Shipment.class_eval do
	def update_amounts
		if selected_shipping_rate			
			self.cost = selected_shipping_rate.cost if !backorder_charge? && !check_categories?
			if changed?
				update_columns(
				cost: cost,
				updated_at: Time.current
				)
			end
		end
	end

	def backorder_charge?
		self.backordered? && Spree::Config[:backorder_charge]
	end

	def check_categories?
		self.order.shipments.count > 1 && self.id != self.order.shipments.first.id && Spree::Config[:check_categories]
	end
end