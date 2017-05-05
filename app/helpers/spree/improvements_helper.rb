module Spree::ImprovementsHelper
	def backorder_charge
	  return Spree::Config[:backorder_charge]
	end

	def show_sku
	  return Spree::Config[:show_sku]
	end

	def show_taxes
	  return Spree::Config[:show_taxes]
	end

	def cookies_accepted?
	  return false unless request.cookies['guest_token'].present?	  
	  true	  
	end

	def flash_messages(opts = {})
	      ignore_types = ["order_completed"].concat(Array(opts[:ignore_types]).map(&:to_s) || [])

	      flash.each do |msg_type, text|
	        unless ignore_types.include?(msg_type)
	          concat(content_tag(:div, text, class: "alert alert-#{msg_type}"))
	        end
	      end
	      nil
	end
end


