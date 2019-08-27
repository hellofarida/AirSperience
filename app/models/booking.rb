class Booking < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :experience

  def past?
    end_on < Date.today
  end

  def booking_price
    self.price = (end_on - start_on) * experience.price
  end
end
