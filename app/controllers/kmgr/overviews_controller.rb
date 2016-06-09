class Kmgr::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :signups_denied unless current_user && current_user.admin?
  end

  def index
    all_signups = Signup.all.order(:clname)
    build_overview all_signups

    @outstanding = all_signups.select do |signup|
      signup.amt_due > 0 || signup.payment.nil? || signup.payment.accepted != '1'
    end
  end

end