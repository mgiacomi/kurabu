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
    crypt = ActiveSupport::MessageEncryptor.new(Rails.configuration.url_enc_base)
    id = crypt.decrypt_and_verify(params[:id])

    @signup = Signup.find(id)
    render :action => "../notification_mailer/fsa"
  end

end
