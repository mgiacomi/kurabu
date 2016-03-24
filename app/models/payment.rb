class Payment < ActiveRecord::Base

  validates :amount, numericality: true, allow_blank: true

  belongs_to :signup

  class << self
  end

end
