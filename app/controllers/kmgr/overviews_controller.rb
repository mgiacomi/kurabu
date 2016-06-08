class Kmgr::OverviewsController < ApplicationController
  before_filter :authenticate_user!

  def index
    all_signups = Signup.all.order(:clname)
    build_overview all_signups

    @outstanding = all_signups.select do |signup|
      signup.amt_due > 0 || signup.payment.nil? || signup.payment.accepted != '1'
    end
  end

end