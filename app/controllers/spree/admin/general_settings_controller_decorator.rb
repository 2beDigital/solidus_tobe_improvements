Spree::Admin::GeneralSettingsController.class_eval do
  alias_method :edit_original, :edit unless method_defined? :edit_original
  alias_method :update_original, :update unless method_defined? :update_original
  
  def edit
    edit_original
    @preferences_order_and_shipments = [ :minimum_order_value, :backorder_charge, :check_categories, :show_sku, :show_taxes]
  end

   def update
      update_original
        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
    end
  end
  
   def testmail
    if Spree::TestMailer.test_email(try_spree_current_user.email).deliver_now
      flash[:success] = Spree.t('mail_methods.testmail.delivery_success')
    else
      flash[:error] = Spree.t('mail_methods.testmail.delivery_error')
    end
  rescue => e
    flash[:error] = Spree.t('mail_methods.testmail.error', e: e)
  ensure
    redirect_to edit_admin_general_settings_path
  end
end