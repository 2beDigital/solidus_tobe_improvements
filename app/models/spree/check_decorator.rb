Spree::PaymentMethod::Check.class_eval do
  def cancel(*)
		ActiveMerchant::Billing::Response.new(true, '666: you must refund manually from tpv admin', {}, {})
	end
  def credit(amount_in_cents, auth_code, gateway_options = {})
	  ActiveMerchant::Billing::Response.new(true, '666: you must refund manually from tpv admin', {}, {})
	end
end
