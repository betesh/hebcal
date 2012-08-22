require 'hebcal/holidaysHelper'

module HebCal
  module Holidays
private
    H = HolidaysHelper.new
public
    def IsPesach date
      H.InRange(H.DistanceToPassover(date), 0, 8)
    end

    def IsShavuot date
      H.InRange(H.DistanceToPassover(date), HolidayConstants::SHAVUOT_DISTANCE, 2)
    end

    def IsRoshHashanah date
      H.InRange(H.DistanceToPassover(date), HolidayConstants::SUKKOT_DISTANCE - 14, 2)
    end

    def IsRoshHaShanah date
      IsRoshHashanah date
    end

    def IsYomKippur date
      H.InRange(H.DistanceToPassover(date), HolidayConstants::SUKKOT_DISTANCE - 5, 1)
    end

    def IsSukkot date
      H.InRange(H.DistanceToPassover(date), HolidayConstants::SUKKOT_DISTANCE, 9)
    end

    def IsMoed date
      distance = H.DistanceToPassover(date)
      H.InRange(distance, 2, 4) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE + 2, 5)
    end

    def IsRegel date
      distance = H.DistanceToPassover(date)
      H.InRange(distance, 0, 8) || H.InRange(distance, HolidayConstants::SHAVUOT_DISTANCE, 2) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE, 9)
    end

    def IsYomTov date
      # Note that Yom Kippur is not a Yom Tov
      distance = H.DistanceToPassover(date)
      result = H.InRange(distance, 0, 2) || H.InRange(distance, 6, 2) || H.InRange(distance, HolidayConstants::SHAVUOT_DISTANCE, 2) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE - 14, 2) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE, 2) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE + 7, 2)
    end
  end
end
