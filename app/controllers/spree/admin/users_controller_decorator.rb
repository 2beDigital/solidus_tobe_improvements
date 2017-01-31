module Spree::Admin
  UsersController.class_eval do
    alias_method :index_original, :index unless method_defined? :index_original
    respond_to :csv, :only => [:index]

    def index
      respond_with(@collection) do |format|
        format.csv { @collection = @search.result and return }
        format.any { index_original }
      end
    end

    private

      def collection
        return @collection if @collection.present?
        if request.xhr? && params[:q].present?
          @collection = Spree.user_class.includes(:bill_address, :ship_address)
                            .where("spree_users.email #{LIKE} :search
                                   OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                                   OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                                   OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)
                                   OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)",
                                  { search: "#{params[:q].strip}%" })
                            .limit(params[:limit] || 100)
        else
          @search = Spree::User.order(created_at: :desc).ransack(params[:q])
          @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        end
      end

  end
 end