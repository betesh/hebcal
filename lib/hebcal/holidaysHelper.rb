require 'hebcal/passover'

module HebCal
  class HolidaysHelper
    include Passover

    def Distance date1, date2
      date1 = (date1 + 60*60) if (!date2.dst? && date1.dst?)
      date2 = (date2 + 60*60) if (date2.dst? && !date1.dst?)
      (date2 - date1) / 24 / 60 / 60
    end

    def DistanceToPassover date
      Distance WhenIsPesach(date.year), date
    end

    def InRange distance, start, length
      (distance >= start) && (distance <= start + length - 1)
    end

    def PesachAndYearLength date
      pesach1 = WhenIsPesach(date.year)
      if (Distance(pesach1, date) < -59) then
        pesach2 = pesach1
        pesach1 = WhenIsPesach(pesach1.year - 1)
      else
        pesach2 = WhenIsPesach(pesach1.year + 1)
      end
      length = Distance pesach1, pesach2
      { :pesach => pesach1, :length => length}
    end
  end
end
