(function($) {

  var SHAVUOT_DISTANCE = 50;
  var SUKKOT_DISTANCE = 59 * 3;

  function is_leap_year(year)
  {
    return (-1 != [3,6,8,11,14,17,19].indexOf(year % 19));
  }

  function precedes_leap_year(year)
  {
    return is_leap_year(year+1);
  }

  function leadingZero(n)
  {
    return n <= 9 ? "0" + n : n;
  }

  function formatDate(date) {
    return date.getFullYear() + "-" + leadingZero(date.getMonth()+1) + "-" + leadingZero(date.getDate());
  }

  function calculate_pesach(yearG) {

    // CONSTANTS
    var HALAKIM_PER_HOUR = 1080;
    var HALAKIM_PER_DAY = 24 * HALAKIM_PER_HOUR;
    var ANNUAL_DRIFT = 10 * HALAKIM_PER_DAY + 21 * HALAKIM_PER_HOUR + 204;
    var JULIAN_ANNUAL_CALENDAR_DRIFT = HALAKIM_PER_HOUR * 6;
    var JULIAN_YEAR = 365.25 * HALAKIM_PER_DAY;

    var LUNAR_CYCLE = 29 * HALAKIM_PER_DAY + 12 * HALAKIM_PER_HOUR + 793;
    var HALAKIM_PER_19_YEAR_CYCLE = 235 * LUNAR_CYCLE;

    var JULIAN_ERROR_PER_19_YEAR_CYCLE = JULIAN_YEAR * 19 - HALAKIM_PER_19_YEAR_CYCLE;
    var EPOCH_TEKUFAH = -(20 * HALAKIM_PER_HOUR + 302);

    var MOLAD_ZAQEN = 6 * HALAKIM_PER_HOUR;
    var TUTAKPAT = 15 * HALAKIM_PER_HOUR + 589;
    var TARAD = 9 * HALAKIM_PER_HOUR + 204;

    // CALCULATE MOLAD
    var yearH = yearG + 3760;
    var drift_since_epoch = (LUNAR_CYCLE + EPOCH_TEKUFAH + (LUNAR_CYCLE - ANNUAL_DRIFT) * (yearH % 19) - HALAKIM_PER_DAY) % LUNAR_CYCLE;
    var year_in_julian_cycle = yearG % 4;
    var molad = LUNAR_CYCLE + HALAKIM_PER_DAY + MOLAD_ZAQEN + drift_since_epoch + (year_in_julian_cycle * JULIAN_ANNUAL_CALENDAR_DRIFT) - (JULIAN_ERROR_PER_19_YEAR_CYCLE * Math.floor(yearH / 19));
    var halakim_into_day = molad % HALAKIM_PER_DAY;

    // CALCULATE CALENDAR DATE OF PESACH
    var gregorian_divergence = Math.floor(yearG/100) - Math.floor(yearG/400) - 2;
    var pesach_julian_day = (molad - halakim_into_day) / HALAKIM_PER_DAY 

    var day_of_week = ((3 * yearG) + (5 * year_in_julian_cycle) + pesach_julian_day) % 7;
    var pesach_day = pesach_julian_day + gregorian_divergence;

    if (-1 != [1,3,5].indexOf(day_of_week)) {
      pesach_day += 1;
    } else if (0 == day_of_week && !precedes_leap_year(yearH) && halakim_into_day >= TARAD + MOLAD_ZAQEN) {
      pesach_day += 2;
    } else if (6 == day_of_week && is_leap_year(yearH) && halakim_into_day >= TUTAKPAT + MOLAD_ZAQEN) {
      pesach_day += 1;
    }
    var pesach_month = 2;

    return new Date(yearG, pesach_month, pesach_day);
  }
  
  $.whenIsPesach = function(yearG)
  {
    return formatDate(calculate_pesach(yearG));
  };

  function parse_date(date) {
    return /([0-9]{3,5})-([0-9]{2})-([0-9]{2})/.exec(date);
  }

  function get_distance(date)
  {
    date = parse_date(date);
    var pesach = calculate_pesach(parseInt(date[1]));
    date = new Date(date[1], date[2] - 1, date[3]);
    return (date - pesach)/24/60/60/1000;
  }

  function is_distance_in_range(distance, begin, length) {
    return distance >= begin && distance <= begin + length - 1;
  }

  $.isPesach = function(date)
  {
    return is_distance_in_range(get_distance(date), 0, 8);
  };

  $.isShavuot = function(date)
  {
    return is_distance_in_range(get_distance(date), SHAVUOT_DISTANCE, 2);
  };


  $.isRoshHashanah = $.isRoshHaShanah = function(date)
  {
    return is_distance_in_range(get_distance(date), SUKKOT_DISTANCE - 14, 2);
  };

  $.isYomKippur = function(date)
  {
    return is_distance_in_range(get_distance(date), SUKKOT_DISTANCE - 5, 1);
  };

  $.isSukkot = function(date)
  {
    return is_distance_in_range(get_distance(date), SUKKOT_DISTANCE, 9);
  };

  $.isMoed = function(date)
  {
    distance = get_distance(date);
    return is_distance_in_range(distance, 2, 4) || is_distance_in_range(distance, SUKKOT_DISTANCE + 2, 5);
  };

  $.isRegel = function(date)
  {
    distance = get_distance(date);
    return is_distance_in_range(distance, 0, 8) || is_distance_in_range(distance, SHAVUOT_DISTANCE, 2) || is_distance_in_range(distance, SUKKOT_DISTANCE, 9);
  };

  $.isYomTov = function(date)
  {
    // Note that Yom Kippur is not a Yom Tov
    distance = get_distance(date);
    return is_distance_in_range(distance, 0, 2) || is_distance_in_range(distance, 6, 2) || is_distance_in_range(distance, SHAVUOT_DISTANCE, 2) || is_distance_in_range(distance, SUKKOT_DISTANCE - 14, 2) || is_distance_in_range(distance, SUKKOT_DISTANCE, 2) || is_distance_in_range(distance, SUKKOT_DISTANCE + 7, 2);
  };

})($);
