passover
========

Determines the date of Passover for a Gregorian year. Also includes boolean functions to check whether a date is a Jewish holiday. Javascript (requires jQuery)

MIT LICENSE
===========

Copyright 2012 Isaac Betesh (iybetesh at gmail)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

To Run Unit Tests
===========
1. Download the latest jQuery library and save it in the root folder of the repo as jquery.js
2. Open index.html in a browser.

To Use
===========
1. All date formats are YYYY-mm-dd, where month is index from 1 (i.e. 1 == January, not the usual javascript index of 0 == January!) and YYYY is the Gregorian year.
2. $.whenIsPesach(yyyy) returns a date in the above format, where yyyy is the Gregorian year.  Note that the date returned is the first day of Pesach, not the day on which Pesach begins at sunset.
3. $.isPesach(d) returns true iff d is a date during Pesach, in the above format.  Note that the day on which Pesach begins at sunset returns false.
4. The following functions work in a similar way to $.isPesach():
 a. $.isShavuot(), $.isRoshHashanah(), $.isYomKippur(), $.isSukkot();
 b. $.isRegel(): $.isPesach() || $.isShavuot() || $.isSukkot();
 c. $.isMoed(): Hol HaMoed Pesach or Hol HaMoed Sukkot);
 d. $.isYomTov(): ($.isPesach() || $.isSukkot() || $.isShavuot() || $.isRoshHashanah()) && !$.isMoed();
  Note that isYomTov(yk) == false, where yk is the date of Yom Kippur.
