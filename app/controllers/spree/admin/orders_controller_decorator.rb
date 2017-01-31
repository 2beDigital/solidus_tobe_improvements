module Spree
  module Admin
    Spree::Admin::OrdersController.class_eval do

      require 'httparty'

      def json_from_api
        if try_spree_current_user && spree_current_user.spree_api_key.present?
          result = HTTParty.get(
              'https://' + Spree::Store.first.url+'/api/orders/'+load_order.number,
              #'/api/orders/'+load_order.number,
              verify: false,
              headers: { "X-Spree-Token" =>   spree_current_user.spree_api_key}
          ).parsed_response
          render :json => result
        else
          flash[:error] = Spree.t(:authorization_failure)
          redirect_to spree.admin_unauthorized_path
        end
      end

      def destroy
        order = Spree::Order.find(params[:id])
        if !order.complete?
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
  end
end
