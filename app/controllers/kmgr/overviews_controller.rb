class Kmgr::OverviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_privileges!, only: [:index]


  def check_privileges!
    redirect_to kmgr_reports_index_path unless current_user.admin?
  end

  def index
    @summeries = Signup.overview

    all_signups = Signup.all.order(:clname)
    @outstanding = all_signups.select do |signup|
      signup.amt_due > 0 || signup.payment.nil? || signup.payment.accepted != '1'
    end
  end

  def search
    @signups = Signup.search params[:term]
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