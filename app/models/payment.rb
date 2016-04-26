class Payment < ActiveRecord::Base

  validates :amount, numericality: true, allow_blank: true

  belongs_to :signup

  class << self
  end

  def receipt_link
    crypt = ActiveSupport::MessageEncryptor.new(Rails.configuration.url_enc_base)
    crypt.encrypt_and_sign(signup_id)
  end

end
