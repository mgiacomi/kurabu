class Kmgr::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :signups_denied unless current_user && current_user.admin?
  end

  def index
    @summeries = Signup.build_overview

    all_signups = Signup.all.order(:clname)
    @outstanding = all_signups.select do |signup|
      signup.amt_due > 0 || signup.payment.nil? || signup.payment.accepted != '1'
    end
  end

  def details
    if params[:grade] == 'Total'
      signups = Signup.where("session#{params[:session]}='1'")
      @grade = "Total"
    else
      signups = Signup.where("cage=? and session#{params[:session]}='1'", params[:grade])
      unless signups.nil?
        @grade = signups[0].cage
      end
    end

    @signups = signups.select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    @session = ActionView::Base.full_sanitizer.sanitize(params[:session])

  end

end