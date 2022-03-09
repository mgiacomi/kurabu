class Payment < ActiveRecord::Base

  validates :amount, numericality: true, allow_blank: true
  validates :scholarship, numericality: true, allow_blank: true

  belongs_to :signup

  class << self
  end

  def receipt_link

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    crypt.encrypt_and_sign(signup_id)
  end

end
