class SignupsController < ApplicationController
  layout "mailer", only: [:receipt]

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new params[:signup]

    if @signup.save
      redirect_to signups_pay_path(@signup.id), notice: 'Registration Accepted.'
    else
      render 'new'
    end
  end

  def pay
    @signup = Signup.find(params[:id])
  end

  def receipt
    @signup = Signup.find_by_receipt_id(params[:id])
    render :action => "../notification_mailer/fsa"
  end

end
