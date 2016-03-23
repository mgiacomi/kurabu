class SignupsController < ApplicationController

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
end
