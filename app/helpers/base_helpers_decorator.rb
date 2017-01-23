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
  return false unless request.cookies['accept.cookies'].present?
  true
end

def flag_image_url(locale)
	asset_url "flags/" + locale.to_s + '.png'
end
