module Spree
  module Admin

    class AffiliatesController < ResourceController
      def index
        params[:q]     ||= {}
        params[:q][:s] ||= 'created_at desc'
        @search = Spree::Affiliate.ransack(params[:q])
        @affiliates = @search.result.page(params[:page]).per(50)
        respond_with(@affiliates)
      end
      def show
        flash[:notice] = request.flash[:notice]
        redirect_to account_url
      end
    end
  end
end