Spree::CheckoutController.class_eval do
  include AffiliateCredits

  private

  def after_complete
    session[:order_id] = nil

    if current_user && current_user.affiliate_partner && current_user.orders.where(:state => 'complete').count == 1
      sender = current_user.referred_by

      # from d4eeaa2b974a01e8c20807d837ef847d81a6fc98
      # sender = current_user.affiliate_partner.partner

      #create credit (if required)
      create_affiliate_credits(sender, current_user, "purchase")
    end
  end
end
