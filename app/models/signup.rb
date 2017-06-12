class Signup < ActiveRecord::Base

  has_one :payment

  validates :cfname, :clname, :cgender, presence: {message: " is required"}
  validates :cday, :cmonth, :cyear, :cage, presence: {message: " is required"}
  validates :p1fname, :p1lname, :street, :city, :state, :zip, :email, :phone1, presence: {message: " is required"}
  validates :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, presence: {message: " is required"}
  validates :activity_cname, :activity_signed, :activity_signed_date, presence: {message: " is required"}
  validates :activity_agree, :presence => true, :inclusion => { :in => ['Yes'], message: " must be checked" }
  validate :at_least_one_session
  validate :k_and_first_not_over_twenty

  class << self
    def find_by_receipt_id receipt_id
      crypt = ActiveSupport::MessageEncryptor.new(Rails.configuration.url_enc_base)
      id = crypt.decrypt_and_verify(receipt_id)
      find(id)
    end
  end

  def amt_due
    s1 = session1 == "1" ? 225 : 0
    s2 = session2 == "1" ? 225 : 0
    s3 = session3 == "1" ? 225 : 0
    s4 = session4 == "1" ? 225 : 0
    s5 = session5 == "1" ? 225 : 0
    total = s1 + s2 + s3 + s4 + s5
    payment.present? ? total - payment.scholarship.to_f - payment.amount.to_f : total
  end

  def total
    s1 = session1 == "1" ? 225 : 0
    s2 = session2 == "1" ? 225 : 0
    s3 = session3 == "1" ? 225 : 0
    s4 = session4 == "1" ? 225 : 0
    s5 = session5 == "1" ? 225 : 0
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

  def k_and_first_not_over_twenty
    signups = Signup.where("cage=? or cage=?", "Kindergarten", "1st Grade")

    if cage == "Kindergarten" || cage == "1st Grade"
      if session1 == "1"
        k1 = signups.select {|s| s.session1 == "1"}.map{|s| 1}.reduce {|s, n| s + n}
        if k1 > 19
          errors.add(:session1,'is already full for Kindergarten and 1st Graders.')
        end
      end

      if session2 == "1"
        k1 = signups.select {|s| s.session2 == "1"}.map{|s| 1}.reduce {|s, n| s + n}
        if k1 > 19
          errors.add(:session2,'is already full for Kindergarten and 1st Graders.')
        end
      end

      if session3 == "1"
        k1 = signups.select {|s| s.session3 == "1"}.map{|s| 1}.reduce {|s, n| s + n}
        if k1 > 19
          errors.add(:session3,'is already full for Kindergarten and 1st Graders.')
        end
      end

      if session4 == "1"
        k1 = signups.select {|s| s.session4 == "1"}.map{|s| 1}.reduce {|s, n| s + n}
        if k1 > 19
          errors.add(:session4,'is already full for Kindergarten and 1st Graders.')
        end
      end

      if session5 == "1"
        k1 = signups.select {|s| s.session5 == "1"}.map{|s| 1}.reduce {|s, n| s + n}
        if k1 > 19
          errors.add(:session5,'is already full for Kindergarten and 1st Graders.')
        end
      end
    end
  end

end
