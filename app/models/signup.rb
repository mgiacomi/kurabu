class Signup < ActiveRecord::Base

  has_one :payment

  validates :cfname, :clname, :cgender, presence: { message: " is required" }
  validates :cday, :cmonth, :cyear, :cage, presence: { message: " is required" }
  validates :p1fname, :p1lname, :street, :city, :state, :zip, :email, :phone1, presence: { message: " is required" }
  validates :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, presence: { message: " is required" }
  validates :activity_cname, :activity_agree, :activity_signed, :activity_signed_date, presence: { message: " is required" }
  validate :at_least_one_session

  class << self
  end

  private

  def at_least_one_session
    unless session1 == "1" || session2 == "1" || session3 == "1" || session4 == "1" || session5 == "1"
        errors.add(:base, "You must select at least one session ")
    end
  end
end
