Spree::BaseController.class_eval do
  before_filter :remember_affiliate

  private
  
  def remember_affiliate
    if params[:ref_id] && cookies[:ref_id].blank? 
      # remember the affiliate referral id
      cookies.permanent[:ref_id] = params[:ref_id] 

      # increment number of referrals for stat purpose
      affiliate = Spree.user_class.find_by_ref_id(params[:ref_id])      
      affiliate.update_attributes(num_referrals: affiliate.num_referrals + 1)
    end      
  end
end
