require 'hebcal/passover'

module HebCal
  class HolidaysHelper
    include Passover

    def DistanceToPassover date
      (date - WhenIsPesach(date.year)) / 24 / 60 / 60
    end

    def InRange distance, start, length
      (distance >= start) && (distance <= start + length - 1)
    end
  end
end
