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
end