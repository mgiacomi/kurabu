class Signup < ActiveRecord::Base
  include SummaryMgr

  has_one :payment

  validates :cfname, :clname, :cgender, presence: {message: " is required"}
  validates :cday, :cmonth, :cyear, :cage, :tsize, presence: {message: " is required"}
  validates :p1fname, :p1lname, :street, :city, :state, :zip, :email, :phone1, presence: {message: " is required"}
  validates :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, presence: {message: " is required"}
  validates :activity_cname, :activity_signed, :activity_signed_date, presence: {message: " is required"}
  validates :activity_agree, :presence => true, :inclusion => { :in => ['Yes'], message: " must be checked" }
  validate :at_least_one_session
  validate :session_not_over_twenty, unless: :skip_session_validation

  attr_accessor :skip_session_validation

  class << self
    def find_by_receipt_id receipt_id
      crypt = ActiveSupport::MessageEncryptor.new(Rails.configuration.url_enc_base)
      id = crypt.decrypt_and_verify(receipt_id)
      find(id)
    end
  end

  def amt_due
    s1 = session1 == "1" ? 260 : 0
    s2 = session2 == "1" ? 210 : 0
    s3 = session3 == "1" ? 260 : 0
    s4 = session4 == "1" ? 260 : 0
    s5 = session5 == "1" ? 260 : 0
    total = s1 + s2 + s3 + s4 + s5
    payment.present? ? total - payment.scholarship.to_f - payment.amount.to_f : total
  end

  def total
    s1 = session1 == "1" ? 260 : 0
    s2 = session2 == "1" ? 210 : 0
    s3 = session3 == "1" ? 260 : 0
    s4 = session4 == "1" ? 260 : 0
    s5 = session5 == "1" ? 260 : 0
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

  def session_not_over_twenty
    class_summary = Signup.class_summary
    classk = class_summary[:classk]
    class1 = class_summary[:class1]
    class2 = class_summary[:class2]
    class3 = class_summary[:class3]
    class4 = class_summary[:class4]

    if cage == 'Kindergarten'
      if session1 == "1" && classk[:s1] > 19
        errors.add(:session1,'is already full for Kindergarten.')
      end
      if session2 == "1" && classk[:s2] > 19
        errors.add(:session2,'is already full for Kindergarten.')
      end
      if session3 == "1" && classk[:s3] > 19
        errors.add(:session3,'is already full for Kindergarten.')
      end
      if session4 == "1" && classk[:s4] > 19
        errors.add(:session4,'is already full for Kindergarten.')
      end
      if session5 == "1" && classk[:s5] > 19
        errors.add(:session5,'is already full for Kindergarten.')
      end
    end

    if cage == '1st Grade'
      if session1 == "1" && class1[:s1] > 19
        errors.add(:session1,'is already full for 1st Graders.')
      end
      if session2 == "1" && class1[:s2] > 19
        errors.add(:session2,'is already full for 1st Graders.')
      end
      if session3 == "1" && class1[:s3] > 19
        errors.add(:session3,'is already full for 1st Graders.')
      end
      if session4 == "1" && class1[:s4] > 19
        errors.add(:session4,'is already full for 1st Graders.')
      end
      if session5 == "1" && class1[:s5] > 19
        errors.add(:session5,'is already full for 1st Graders.')
      end
    end

    if cage == '2nd Grade'
      if session1 == "1" && class2[:s1] > 19
        errors.add(:session1,'is already full for 2nd Graders.')
      end
      if session2 == "1" && class2[:s2] > 19
        errors.add(:session2,'is already full for 2nd Graders.')
      end
      if session3 == "1" && class2[:s3] > 19
        errors.add(:session3,'is already full for 2nd Graders.')
      end
      if session4 == "1" && class2[:s4] > 19
        errors.add(:session4,'is already full for 2nd Graders.')
      end
      if session5 == "1" && class2[:s5] > 19
        errors.add(:session5,'is already full for 2nd Graders.')
      end
    end

    if cage == '3rd Grade'
      if session1 == "1" && class3[:s1] > 19
        errors.add(:session1,'is already full for 3rd Graders.')
      end
      if session2 == "1" && class3[:s2] > 19
        errors.add(:session2,'is already full for 3rd Graders.')
      end
      if session3 == "1" && class3[:s3] > 19
        errors.add(:session3,'is already full for 3rd Graders.')
      end
      if session4 == "1" && class3[:s4] > 19
        errors.add(:session4,'is already full for 3rd Graders.')
      end
      if session5 == "1" && class3[:s5] > 19
        errors.add(:session5,'is already full for 3rd Graders.')
      end
    end

    if cage == '4th Grade' || cage == '5th Grade'
      if session1 == "1" && class4[:s1] > 19
        errors.add(:session1,'is already full for 4th and 5th Graders.')
      end
      if session2 == "1" && class4[:s2] > 19
        errors.add(:session2,'is already full for 4th and 5th Graders.')
      end
      if session3 == "1" && class4[:s3] > 19
        errors.add(:session3,'is already full for 4th and 5th Graders.')
      end
      if session4 == "1" && class4[:s4] > 19
        errors.add(:session4,'is already full for 4th and 5th Graders.')
      end
      if session5 == "1" && class4[:s5] > 19
        errors.add(:session5,'is already full for 4th and 5th Graders.')
      end
    end
  end

end
