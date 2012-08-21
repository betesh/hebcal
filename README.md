# HebCal

Determines the date of Passover for a Gregorian year. Also includes boolean functions to check whether a date is a Jewish holiday.
Supported languages:
 Javascript (requires jQuery)
 Ruby (currently only support getting the date of Passover)

## Installation as a Ruby gem

Add this line to your application's Gemfile:
    gem 'hebcal'
And then execute:
    $ bundle
Or install it yourself as:
    $ gem install hebcal

## Ruby Version

### To Run Unit Tests
    $ rake test

### To Use
In the class where you want to use it, declare `include HebCal::Passover`

1. `WhenIsPesach(yyyy)` returns a Ruby Time object representing midnight on the first day of passover, where `yyyy` is the Gregorian year
    Note that the date returned is the first day of Pesach, not the day on which Pesach begins at sunset.
    3- and 4-digit years are supported, so the domain of valid years is 100-9999.  For years before the Gregorian transition (1582), the transition is ignored and the proleptic Gregorian calendar is used.

## Javascript Version

### To Run Unit Tests
1. Download the latest jQuery library and save it in the root folder of the repo as jquery.js
2. Open index.html in a browser.

### To Use
1. All date formats are YYYY-mm-dd, where month is index from 1 (i.e. 1 == January, not the usual javascript index of 0 == January!) and YYYY is the Gregorian year.
    3- and 4-digit years are supported, so the domain of valid years is 100-9999.  For years before the Gregorian transition (1582), the transition is ignored and the proleptic Gregorian calendar is used.
2. $.whenIsPesach(yyyy) returns a date in the above format, where yyyy is the Gregorian year.
    Note that the date returned is the first day of Pesach, not the day on which Pesach begins at sunset.
3. $.isPesach(d) returns true iff d is a date during Pesach, in the above format.  Note that the day on which Pesach begins at sunset returns false.
4. The following functions work in a similar way to $.isPesach():
 1. $.isShavuot(), $.isRoshHashanah(), $.isYomKippur(), $.isSukkot();
 2. $.isRegel(): $.isPesach() || $.isShavuot() || $.isSukkot();
 3. $.isMoed(): Hol HaMoed Pesach or Hol HaMoed Sukkot);
 4. $.isYomTov(): ($.isPesach() || $.isSukkot() || $.isShavuot() || $.isRoshHashanah()) && !$.isMoed();
    Note that isYomTov(yk) == false, where yk is the date of Yom Kippur.
