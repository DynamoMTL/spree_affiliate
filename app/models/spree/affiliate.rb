class Spree::Affiliate < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :partner, :class_name => "Spree::User", :foreign_key => :partner_id
  belongs_to :user, :class_name => 'Spree::User'
  has_many :events, :class_name => "Spree::AffiliateEvent"
=======
  belongs_to :partner,
    class_name: 'Spree::User',
    foreign_key: :partner_id
  belongs_to :user,
    class_name: 'Spree::User'
  has_many :events,
    class_name: 'Spree::AffiliateEvent'
>>>>>>> 5ac6d5c1972c684ccc4cbe437bf7a49b1c1d9d7d

  def name
    I18n.t(:affiliate_program)
  end

  def ref_id
<<<<<<< HEAD
    partner ? partner.ref_id : ''
=======
    partner.try(:ref_id) || ''
>>>>>>> 5ac6d5c1972c684ccc4cbe437bf7a49b1c1d9d7d
  end
end
