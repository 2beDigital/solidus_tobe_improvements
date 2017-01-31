Spree::Order.class_eval do
	alias_method :orig_deliver_order_confirmation_email,  :deliver_order_confirmation_email unless method_defined? :orig_deliver_order_confirmation_email

	def checkout_allowed?
		return :not_empty     unless line_items.count > 0
		return :minimum_order_value unless total >= Spree::Config[:minimum_order_value].to_f
		true
	end

	# override this to also set current user locale for email i18n
	def deliver_order_confirmation_email
		update_attribute(:locale, I18n.locale) if self.has_attribute?(:locale)
    	orig_deliver_order_confirmation_email
	end

end