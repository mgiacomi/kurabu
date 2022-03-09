class SignupsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:paypal]
  layout "mailer", only: [:receipt]

  def new
    @signup = Signup.new

    class_summary = Signup.class_summary
    @classk = class_summary[:classk]
    @class1 = class_summary[:class1]
    @class2 = class_summary[:class2]
    @class3 = class_summary[:class3]
    @class4 = class_summary[:class4]
  end

  def create
    @signup = Signup.new signup_params

    class_summary = Signup.class_summary
    @classk = class_summary[:classk]
    @class1 = class_summary[:class1]
    @class2 = class_summary[:class2]
    @class3 = class_summary[:class3]
    @class4 = class_summary[:class4]

    if @signup.save
      redirect_to signups_pay_path(@signup.id), notice: 'Registration Accepted.'
    else
      render 'new'
    end
  end

  def pay
    @signup = Signup.find params[:id]
  end

  def receipt
    @signup = Signup.find_by_receipt_id params[:id]
    render :action => "../notification_mailer/fsa"
  end

  def paypal
    if params[:payment_status] == "Completed"
      signup_id = params[:invoice].split('-')[0]
      payment = Payment.find_or_create_by(signup_id: signup_id)

      payment.accepted = '1'
      payment.pmtnum = "Paypal"
      payment.pmtdate = params[:payment_date]
      payment.amount = params[:payment_gross]
      payment.fee = params[:payment_fee]

      if payment.save
        logger.info "Saved Payment: #{params[:invoice]} #{params[:payment_gross]} #{params[:payment_status]} #{params[:payment_date]}"
      else
        logger.info "Failed to save payment: #{params[:invoice]} #{params[:payment_gross]} #{params[:payment_status]} #{params[:payment_date]}"
      end

      if !payment.signup.nil? && payment.signup.amt_due == 0
        logger.info "Processing receipt for email #{payment.signup.email}"

        NotificationMailer.fsa(payment.signup).deliver

        payment.receipt_date = Time.now
        payment.save
      end
    end
  end

  def denied
  end

  def signup_params
    params.require(:signup).permit(:cfname, :clname, :cgender, :cmonth, :cday, :cyear, :cage, :p1fname, :p1lname, :p2fname, :p2lname, :phone1, :phone2,
                                   :email, :street, :city, :state, :zip, :tsize, :session1, :session2, :session3, :session4, :session5, :special, :medical,
                                   :medical_agree, :medical_signed, :medical_signed_date, :shots_date, :econtact_name, :econtact_relationship, :econtact_phone,
                                   :econtact_address, :activity_cname, :activity_agree, :activity_signed, :activity_signed_date, :photo_agree, :photo_signed,
                                   :photo_signed_date, :directions, :friends)
  end

end
