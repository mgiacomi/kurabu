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

    if @signup.update(signup_params)
      redirect_to kmgr_form_path(@signup), notice: 'Application was successfully updated.'
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

    if @payment.update(payment_params)
      redirect_to kmgr_form_path(@payment.signup), notice: 'Payment was successfully updated.'
    else
      render :action => "show"
    end
  end

  def signup_params
    params.require(:signup).permit(:cfname, :clname, :cgender, :cmonth, :cday, :cyear, :cage, :p1fname, :p1lname, :p2fname, :p2lname, :phone1, :phone2,
                                   :email, :street, :city, :state, :zip, :tsize, :session1, :session2, :session3, :session4, :session5, :special, :medical,
                                   :medical_agree, :medical_signed, :medical_signed_date, :shots_date, :pickup_name, :pickup_relationship, :pickup_phone,
                                   :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, :activity_cname,
                                   :activity_agree, :activity_signed, :activity_signed_date, :photo_agree, :photo_signed, :photo_signed_date,
                                   :art_agree, :art_signed, :art_signed_date, :directions, :friends)
  end

  def payment_params
    params.require(:payment).permit(:accepted, :pmtnum, :pmtdate, :amount, :fee, :scholarship)
  end

end