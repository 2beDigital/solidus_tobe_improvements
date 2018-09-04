module Spree::ImprovementsHelper

	def get_google_tag_manager_id
		@gtm = Spree::Tracker.where('gtm_id like ? AND active = ?', "GTM%", true).last
	end

	def get_facebook_pixel_id
		Spree::Tracker.where('facebook_pixel_id <> ? AND active = ?', '', true).last
	end


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


