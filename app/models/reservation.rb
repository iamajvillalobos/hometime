class Reservation < ApplicationRecord
  class MethodNotAllowed < StandardError
  end

  belongs_to :guest

  validates :code, uniqueness: true

  define_method :airbnb_details do
    if source == 'airbnb'
      additional_details
    else
      raise MethodNotAllowed
    end
  end
end
