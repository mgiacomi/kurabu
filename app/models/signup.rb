class Signup < ActiveRecord::Base
  include SummaryMgr

  has_one :payment

  validates :cfname, :clname, :cgender, presence: { message: " is required" }
  validates :cday, :cmonth, :cyear, :cage, presence: { message: " is required" }
  validates :p1fname, :p1lname, :street, :city, :state, :zip, :email, :phone1, presence: { message: " is required" }
  validates :econtact_name, :econtact_relationship, :econtact_phone, :econtact_address, presence: { message: " is required" }
  validates :activity_cname, :activity_signed, :activity_signed_date, presence: { message: " is required" }
  validates :activity_agree, :presence => true, :inclusion => { :in => ['Yes'], message: " must be checked" }
  validate :at_least_one_session
  validate :session_not_over_one_hundred, unless: :skip_session_validation
  #validate :class_not_over_twenty, unless: :skip_session_validation

  attr_accessor :skip_session_validation

  class << self
    def find_by_receipt_id receipt_id
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
      id = crypt.decrypt_and_verify(receipt_id)
      find(id)
    end
  end

  scope :search, lambda { |term|
    term = "%#{term}%"
    where('lower(clname) like ? or lower(p1lname) like ?', term.downcase, term.downcase).order(:clname, :p1lname)
  }

  def grade_short
    cage.first
  end

  def amt_due
    s1 = session1 == "1" ? 275 : 0
    s2 = session2 == "1" ? 220 : 0
    s3 = session3 == "1" ? 275 : 0
    s4 = session4 == "1" ? 275 : 0
    s5 = session5 == "1" ? 275 : 0
    total = s1 + s2 + s3 + s4 + s5
    payment.present? ? total - payment.scholarship.to_f - payment.amount.to_f : total
  end

  def total
    s1 = session1 == "1" ? 275 : 0
    s2 = session2 == "1" ? 220 : 0
    s3 = session3 == "1" ? 275 : 0
    s4 = session4 == "1" ? 275 : 0
    s5 = session5 == "1" ? 275 : 0
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

  def session_not_over_one_hundred
    summaries = Signup.summaries

    if session1 == "1" && summaries[:total][:s1] > 99
      errors.add(:session1, 'is already full.')
    end
    if session2 == "1" && summaries[:total][:s2] > 99
      errors.add(:session2, 'is already full.')
    end
    if session3 == "1" && summaries[:total][:s3] > 99
      errors.add(:session3, 'is already full.')
    end
    if session4 == "1" && summaries[:total][:s4] > 99
      errors.add(:session4, 'is already full.')
    end
    if session5 == "1" && summaries[:total][:s5] > 99
      errors.add(:session5, 'is already full.')
    end
  end

  def class_not_over_twenty
    summaries = Signup.summaries
    classk = summaries[:classk]
    class1 = summaries[:class1]
    class2 = summaries[:class2]
    class3 = summaries[:class3]
    class4 = summaries[:class4]

    if cage == 'Kindergarten'
      if session1 == "1" && classk[:s1] > 19
        errors.add(:session1, 'is already full for Kindergarten.')
      end
      if session2 == "1" && classk[:s2] > 19
        errors.add(:session2, 'is already full for Kindergarten.')
      end
      if session3 == "1" && classk[:s3] > 19
        errors.add(:session3, 'is already full for Kindergarten.')
      end
      if session4 == "1" && classk[:s4] > 19
        errors.add(:session4, 'is already full for Kindergarten.')
      end
      if session5 == "1" && classk[:s5] > 19
        errors.add(:session5, 'is already full for Kindergarten.')
      end
    end

    if cage == '1st Grade'
      if session1 == "1" && class1[:s1] > 19
        errors.add(:session1, 'is already full for 1st Graders.')
      end
      if session2 == "1" && class1[:s2] > 19
        errors.add(:session2, 'is already full for 1st Graders.')
      end
      if session3 == "1" && class1[:s3] > 19
        errors.add(:session3, 'is already full for 1st Graders.')
      end
      if session4 == "1" && class1[:s4] > 19
        errors.add(:session4, 'is already full for 1st Graders.')
      end
      if session5 == "1" && class1[:s5] > 19
        errors.add(:session5, 'is already full for 1st Graders.')
      end
    end

    if cage == '2nd Grade'
      if session1 == "1" && class2[:s1] > 19
        errors.add(:session1, 'is already full for 2nd Graders.')
      end
      if session2 == "1" && class2[:s2] > 19
        errors.add(:session2, 'is already full for 2nd Graders.')
      end
      if session3 == "1" && class2[:s3] > 19
        errors.add(:session3, 'is already full for 2nd Graders.')
      end
      if session4 == "1" && class2[:s4] > 19
        errors.add(:session4, 'is already full for 2nd Graders.')
      end
      if session5 == "1" && class2[:s5] > 19
        errors.add(:session5, 'is already full for 2nd Graders.')
      end
    end

    if cage == '3rd Grade'
      if session1 == "1" && class3[:s1] > 19
        errors.add(:session1, 'is already full for 3rd Graders.')
      end
      if session2 == "1" && class3[:s2] > 19
        errors.add(:session2, 'is already full for 3rd Graders.')
      end
      if session3 == "1" && class3[:s3] > 19
        errors.add(:session3, 'is already full for 3rd Graders.')
      end
      if session4 == "1" && class3[:s4] > 19
        errors.add(:session4, 'is already full for 3rd Graders.')
      end
      if session5 == "1" && class3[:s5] > 19
        errors.add(:session5, 'is already full for 3rd Graders.')
      end
    end

    if cage == '4th Grade' || cage == '5th Grade'
      if session1 == "1" && class4[:s1] > 19
        errors.add(:session1, 'is already full for 4th and 5th Graders.')
      end
      if session2 == "1" && class4[:s2] > 19
        errors.add(:session2, 'is already full for 4th and 5th Graders.')
      end
      if session3 == "1" && class4[:s3] > 19
        errors.add(:session3, 'is already full for 4th and 5th Graders.')
      end
      if session4 == "1" && class4[:s4] > 19
        errors.add(:session4, 'is already full for 4th and 5th Graders.')
      end
      if session5 == "1" && class4[:s5] > 19
        errors.add(:session5, 'is already full for 4th and 5th Graders.')
      end
    end
  end

end
