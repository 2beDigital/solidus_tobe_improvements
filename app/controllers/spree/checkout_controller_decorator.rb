Spree::CheckoutController.class_eval do

  def ensure_checkout_allowed
    check = @order.checkout_allowed?
    unless check == true
      redirect_to spree.root_path, :flash => {:notice => I18n.t("checkout_allowed_errors.#{check}") + Spree::Config[:minimum_order_value] + " " + Spree::Config[:currency]}
    end
  end

  private

    def check_registration
      return unless Spree::Auth::Config[:registration_step]
      return if spree_current_user or current_order.email
      store_location
      redirect_to spree.signup_path
    end

     def before_address
        # if the user has a default address, a callback takes care of setting
        # that; but if he doesn't, we need to build an empty one here
        if spree_current_user && !spree_current_user.bill_address.blank?
          @order.bill_address = spree_current_user.bill_address
          @order.ship_address = spree_current_user.ship_address.blank? ? spree_current_user.bill_address : spree_current_user.ship_address
        else          
          @order.bill_address ||= Spree::Address.build_default
          @order.ship_address ||= Spree::Address.build_default if @order.checkout_steps.include?('delivery')
        end
    end
end
