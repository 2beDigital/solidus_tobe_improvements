Spree::Admin::GeneralSettingsController.class_eval do
  	alias_method :edit_original, :edit unless method_defined? :edit_original
  	alias_method :update_original, :update unless method_defined? :update_original
	def edit
		edit_original
		@preferences_order_and_shipments = [:require_terms_and_conditions, :minimum_order_value, :backorder_charge, :check_categories, :show_sku, :show_taxes]
	end

   def update
    	update_original
        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
		end
	end
end