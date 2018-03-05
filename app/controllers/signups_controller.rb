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
    @signup = Signup.new params[:signup]

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

end
