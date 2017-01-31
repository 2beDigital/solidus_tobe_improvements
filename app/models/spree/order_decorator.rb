Spree::Order.class_eval do
	alias_method :orig_deliver_order_confirmation_email,  :deliver_order_confirmation_email unless method_defined? :orig_deliver_order_confirmation_email

	def checkout_allowed?
		return :not_empty     unless line_items.count > 0
		return :minimum_order_value unless total >= Spree::Config[:minimum_order_value].to_f
		true
	end	
end
