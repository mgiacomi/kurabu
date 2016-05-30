class Signup < ActiveRecord::Base

  has_one :payment

  validates :cfname, :clname, :cgender, presence: {message: " is required"}
  validates :cday, :cmonth, :cyear, :cage, presence: {message: " is required"}
  validates :p1fname, :p1lname, :street, :city, :state, :zip, :email, :phone1, presence: {message: " is required"}
  validates :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, presence: {message: " is required"}
  validates :activity_cname, :activity_agree, :activity_signed, :activity_signed_date, presence: {message: " is required"}
  validate :at_least_one_session

  class << self
    def find_by_receipt_id receipt_id
      crypt = ActiveSupport::MessageEncryptor.new(Rails.configuration.url_enc_base)
      id = crypt.decrypt_and_verify(receipt_id)
      find(id)
    end
  end

  def amt_due
    s1 = session1 == "1" ? 215 : 0
    s2 = session2 == "1" ? 215 : 0
    s3 = session3 == "1" ? 175 : 0
    s4 = session4 == "1" ? 215 : 0
    s5 = session5 == "1" ? 215 : 0
    total = s1 + s2 + s3 + s4 + s5
    payment.present? ? total - payment.scholarship.to_f - payment.amount.to_f : total
  end

  def total
    s1 = session1 == "1" ? 215 : 0
    s2 = session2 == "1" ? 215 : 0
    s3 = session3 == "1" ? 175 : 0
    s4 = session4 == "1" ? 215 : 0
    s5 = session5 == "1" ? 215 : 0
    s1 + s2 + s3 + s4 + s5
  end

  class << self
  end

  private

  def at_least_one_session
    unless session1 == "1" || session2 == "1" || session3 == "1" || session4 == "1" || session5 == "1"
      errors.add(:base, "You must select at least one session ")
    end
  end
end
