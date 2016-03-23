class Payment < ActiveRecord::Base

  belongs_to :signup

  class << self
  end

end
