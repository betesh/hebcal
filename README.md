# HebCal

Determines the date of Passover for a Gregorian year. Also includes boolean functions to check whether a date is a Jewish holiday.
Supported languages:
 Javascript (requires jQuery)
 Ruby

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

#### General notes

    3- and 4-digit years are supported, so the domain of valid years is 100-9999.  For years before the Gregorian transition (1582), the transition is ignored and the proleptic Gregorian calendar is used.

#### Calculating the date of Passover
1. In the desired class, declare `include HebCal::Passover`

2. `WhenIsPesach(yyyy)` returns a Ruby Time object representing midnight on the first day of passover, where `yyyy` is the Gregorian year

    Note that the date returned is the first day of Pesach, not the day on which Pesach begins at sunset.

#### Finding out if a date is a holiday
1. In the desired class, declare `include HebCal::Holidays`

1. `IsPesach(d)` returns true iff d is a Ruby Time object representing a date during Pesach.  Note that the day on which Pesach begins at sunset returns false.
1. The following functions work in a similar way to `IsPesach()`:
 1. `IsShavuot()`, `IsRoshHashanah()`, `IsYomKippur()`, `IsSukkot()`

 1. `IsRegel()`: `IsPesach() || IsShavuot || IsSukkot()`

 1. `IsMoed()`: Hol HaMoed Pesach or Hol HaMoed Sukkot

 1. `IsYomTov()`: `(IsPesach() || IsShavuot() || IsRoshHashanah() || IsSukkot()) && !IsMoed()`

     Note that IsYomTov(yk) == false, where yk is the date of Yom Kippur.

## Javascript Version

### To Run Unit Tests
1. Download the latest jQuery library and save it in the root folder of the repo as jquery.js
1. Open index.html in a browser.

### To Use
1. All date formats are YYYY-mm-dd, where month is index from 1 (i.e. 1 == January, not the usual javascript index of 0 == January!) and YYYY is the Gregorian year.

    3- and 4-digit years are supported, so the domain of valid years is 100-9999.  For years before the Gregorian transition (1582), the transition is ignored and the proleptic Gregorian calendar is used.
1. $.whenIsPesach(yyyy) returns a date in the above format, where yyyy is the Gregorian year.

    Note that the date returned is the first day of Pesach, not the day on which Pesach begins at sunset.
1. $.isPesach(d) returns true iff d is a date during Pesach, in the above format.  Note that the day on which Pesach begins at sunset returns false.
1. The following functions work in a similar way to $.isPesach():
 1. $.isShavuot(), $.isRoshHashanah(), $.isYomKippur(), $.isSukkot();

 1. $.isRegel(): $.isPesach() || $.isShavuot() || $.isSukkot();

 1. $.isMoed(): Hol HaMoed Pesach or Hol HaMoed Sukkot;

 1. $.isYomTov(): ($.isPesach() || $.isSukkot() || $.isShavuot() || $.isRoshHashanah()) && !$.isMoed();

     Note that isYomTov(yk) == false, where yk is the date of Yom Kippur.
