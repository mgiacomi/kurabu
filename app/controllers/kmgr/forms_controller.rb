class Kmgr::FormsController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :signups_denied unless current_user && current_user.admin?
  end

  def index
    @signups = Signup.all.order(:clname)
  end

  def show
    @payment = Payment.find_or_create_by(signup_id: params[:id])
  end

  def edit
    @signup = Signup.find(params[:id])
  end

  def update
    @signup = Signup.find(params[:id])
    @signup.skip_session_validation = true

    if @signup.update_attributes(params[:signup])
      redirect_to kmgr_forms_path, notice: 'Application was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def delete
    @signup = Signup.find(params[:id])
    @signup.destroy
    redirect_to kmgr_forms_path, alert: "Application for #{@signup.cfname} #{@signup.clname} has been deleted."
  end

  def payment_update
    @payment = Payment.find_or_create_by(signup_id: params[:payment][:signup_id])

    if @payment.update_attributes(params[:payment])
      redirect_to kmgr_form_path(@payment.signup), notice: 'Payment was successfully updated.'
    else
      render :action => "show"
    end
  end

end