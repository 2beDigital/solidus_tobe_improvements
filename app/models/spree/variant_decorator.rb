Spree::Variant.class_eval do 
	before_validation :build_vat_prices, if: -> { rebuild_vat_prices? }
end