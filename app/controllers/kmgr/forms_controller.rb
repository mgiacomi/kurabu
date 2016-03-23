class Kmgr::FormsController < ApplicationController
  before_filter :authenticate_user!

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

    if @signup.update_attributes(params[:signup])
      redirect_to kmgr_forms_path, notice: 'Application was successfully updated.'
    else
      render :action => "edit"
    end
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