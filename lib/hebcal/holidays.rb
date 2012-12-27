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
    alias_method :IsRoshHaShanah,  :IsRoshHashanah

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

    def IsPurim date
      H.InRange(H.DistanceToPassover(date), HolidayConstants::PURIM_DISTANCE, 1)
    end

    def IsHanukah date
      hash = H.PesachAndYearLength date
      distance = HolidayConstants::STANDARD_HANUKAH_DISTANCE
      distance = distance + 1 if [355, 385].include?(hash[:length])
      H.InRange(H.Distance(hash[:pesach], date), distance, 8)
    end

    alias_method :IsHanukkah,  :IsHanukah
    alias_method :IsHanuka,    :IsHanukah
    alias_method :IsHanukka,   :IsHanukah
    alias_method :IsChanukah,  :IsHanukah
    alias_method :IsChanukkah, :IsHanukah
    alias_method :IsChanuka,   :IsHanukah
    alias_method :IsChanukka,  :IsHanukah

    def Is10Tevet date
      hash = H.PesachAndYearLength date
      distance = HolidayConstants::STANDARD_10_TEVET_DISTANCE
      distance = distance - 1 if [353, 383].include?(hash[:length])
      distance = distance + 1 if [355, 385].include?(hash[:length])
      H.InRange(H.Distance(hash[:pesach], date), distance, 1)
    end

    def IsTaanitEster date
      (6 != date.wday && H.InRange(H.DistanceToPassover(date), HolidayConstants::PURIM_DISTANCE - 1, 1)) || (4 == date.wday && H.InRange(H.DistanceToPassover(date), HolidayConstants::PURIM_DISTANCE - 3, 1))
    end
    alias_method :IsTaanitEsther, :IsTaanitEster

    def IsFastWithSundayPostponement date, distance
      (6 != date.wday && H.InRange(H.DistanceToPassover(date), distance, 1)) || (0 == date.wday && H.InRange(H.DistanceToPassover(date), distance + 1, 1))
    end

    def Is9Ab date
      IsFastWithSundayPostponement date, HolidayConstants::FAST_AB_DISTANCE
    end
    alias_method :Is9Av, :Is9Ab

    def Is17Tammuz date
      IsFastWithSundayPostponement date, HolidayConstants::FAST_AB_DISTANCE - 21
    end
    alias_method :Is17Tamuz, :Is17Tammuz

    def IsFastOfGedalia date
      IsFastWithSundayPostponement date, HolidayConstants::SUKKOT_DISTANCE - 12
    end
    alias_method :IsFastOfGedaliah, :IsFastOfGedalia
    alias_method :IsTzomGedalia, :IsFastOfGedalia
    alias_method :IsTzomGedaliah, :IsFastOfGedalia

    def IsTaanit date
      return false if 6 == date.wday
      distance = H.DistanceToPassover(date)
      H.InRange(distance, HolidayConstants::FAST_AB_DISTANCE, 1) || H.InRange(distance, HolidayConstants::FAST_AB_DISTANCE - 21, 1) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE - 12, 1) || H.InRange(distance, HolidayConstants::PURIM_DISTANCE - 1, 1) || (0 == date.wday && (H.InRange(distance, HolidayConstants::FAST_AB_DISTANCE + 1, 1) || H.InRange(distance, HolidayConstants::FAST_AB_DISTANCE - 21 + 1, 1) || H.InRange(distance, HolidayConstants::SUKKOT_DISTANCE - 12 + 1, 1))) || (4 == date.wday && H.InRange(distance, HolidayConstants::PURIM_DISTANCE - 3, 1)) || Is10Tevet(date)
    end

    def IsRoshHodesh date
      hash = H.PesachAndYearLength date
      distance = H.Distance(hash[:pesach], date)
      length = hash[:length]
      distances =      [   -59 + 15,    -59 + 16,    -59 + 30 + 15] # Adar(2) Nisan
      distances.concat [         15,          16,          30 + 15] # Iyar Sivan
      distances.concat [    59 + 15,     59 + 16,     59 + 30 + 15] # Tamuz Ab
      distances.concat [2 * 59 + 15, 2 * 59 + 16]                   # Elul
      distances.concat [3 * 59 + 15, 3 * 59 + 16, 3 * 59 + 30 + 15] # Heshvan, 1st day Kislev
      if [353, 383].include? length then
        distances.concat [4 * 59 + 15] # Tevet
        distances.concat [4 * 59 + 30 + 14] # Shevat
        distances.concat [5 * 59 + 14, 5 * 59 + 15] if 383 == length # Adar1
      elsif [354, 384].include? length then
        distances.concat [4 * 59 + 15, 4 * 59 + 16] # Tevet
        distances.concat [4 * 59 + 30 + 15] # Shevat
        distances.concat [5 * 59 + 15, 5 * 59 + 16] if 384 == length # Adar1
      elsif [355, 385].include? length then
        distances.concat [3 * 59 + 30 + 16] # 2nd day Kislev
        distances.concat [4 * 59 + 16, 4 * 59 + 17] # Tevet
        distances.concat [4 * 59 + 30 + 16] # Shevat
        distances.concat [5 * 59 + 16, 5 * 59 + 17] if 385 == length # Adar1
      end
      distances.include? distance
    end
    alias_method :IsRoshChodesh, :IsRoshHodesh
  end
end
