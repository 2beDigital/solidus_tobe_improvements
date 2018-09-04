Spree::Admin::OrdersController.class_eval do

  def resend
    Spree::OrderMailer.confirm_email(@order, true).deliver_later
    flash[:success] = Spree.t(:order_email_resent)

    redirect_to(spree.edit_admin_order_path(@order))
  end

  def destroy
    order = Spree::Order.find(params[:id])
    if !order.complete?
      order.all_adjustments.delete_all
      order.delete
      flash[:success] = I18n.t(:order_delete)
      respond_with(order) do |format|
        format.html { redirect_to :back }
        format.js   { render_js_for_destroy }
      end
    else
       flash[:notice] = I18n.t(:order_not_delete)   
       redirect_to :back      
    end
  end
end