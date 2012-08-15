$(document).ready(function(){
  var output = "";
  var tests = 0;
  var passing = 0;
  var failing = 0;

  function passed(name) {
    passing +=1;
    tests += 1;
    output += "<div style=\"color:green;\">Test " + name + ": Passed</div>";
  }

  assert_eq = assert_equal = function(name, actual, expected) {
    if (actual == expected) {
      passed(name);
    } else {
      tests += 1;
      failing += 1;
      output += "<div style=\"color:red;\">Test " + name + ": Failed (should have equaled: " + expected + ", actual: " + actual + ")</div>";
    }
  }

  assert_ne = assert_not_equal = function(name, actual, expected) {
    if (actual != expected) {
      passed(name);
    } else {
      tests += 1;
      failing += 1;
      output += "<div style=\"color:red;\">Test " + name + ": Failed (should not have equaled: " + expected + ")</div>";
    }
  }

  function assert_true(name, actual) {
    assert_equal(name, actual, true);
  }

  function assert_false(name, actual) {
    assert_equal(name, actual, false);
  }

  function assert_day_of_week(name, date, day)
  {
    date = /([0-9]{3,4})-([0-9]{2})-([0-9]{2})/.exec(date);
    date = new Date(date[1], date[2] - 1, date[3]);
    assert_eq(name, date.getDay(), day);
  }

  // Test full 19-year cycle to verify that leap months are accounted correctly
  assert_eq("CorrectDateInYear1OfCycle", $.whenIsPesach(1998), "1998-04-11");
  assert_eq("CorrectDateInYear2OfCycle", $.whenIsPesach(1999), "1999-04-01");
  assert_eq("CorrectDateInYear3OfCycle", $.whenIsPesach(2000), "2000-04-20");
  assert_eq("CorrectDateInYear4OfCycle", $.whenIsPesach(2001), "2001-04-08");
  assert_eq("CorrectDateInYear5OfCycle", $.whenIsPesach(2002), "2002-03-28");
  assert_eq("CorrectDateInYear6OfCycle", $.whenIsPesach(2003), "2003-04-17");
  assert_eq("CorrectDateInYear7OfCycle", $.whenIsPesach(2004), "2004-04-06");
  assert_eq("CorrectDateInYear8OfCycle", $.whenIsPesach(2005), "2005-04-24");
  assert_eq("CorrectDateInYear9OfCycle", $.whenIsPesach(2006), "2006-04-13");
  assert_eq("CorrectDateInYear10OfCycle", $.whenIsPesach(2007), "2007-04-03");
  assert_eq("CorrectDateInYear11OfCycle", $.whenIsPesach(2008), "2008-04-20");
  assert_eq("CorrectDateInYear12OfCycle", $.whenIsPesach(2009), "2009-04-09");
  assert_eq("CorrectDateInYear13OfCycle", $.whenIsPesach(2010), "2010-03-30");
  assert_eq("CorrectDateInYear14OfCycle", $.whenIsPesach(2011), "2011-04-19");
  assert_eq("CorrectDateInYear15OfCycle", $.whenIsPesach(2012), "2012-04-07");
  assert_eq("CorrectDateInYear16OfCycle", $.whenIsPesach(2013), "2013-03-26");
  assert_eq("CorrectDateInYear17OfCycle", $.whenIsPesach(2014), "2014-04-15");
  assert_eq("CorrectDateInYear18OfCycle", $.whenIsPesach(2015), "2015-04-04");
  assert_eq("CorrectDateInYear19OfCycle", $.whenIsPesach(2016), "2016-04-23");

  // Test each year type to verify that date is calculated based on molad
  assert_eq("CorrectDateInYearType1", $.whenIsPesach(2019), "2019-04-20");
  assert_eq("CorrectDateInYearType2", $.whenIsPesach(2013), "2013-03-26");
  assert_eq("CorrectDateInYearType3", $.whenIsPesach(2001), "2001-04-08");
  assert_eq("CorrectDateInYearType4", $.whenIsPesach(2024), "2024-04-23");
  assert_eq("CorrectDateInYearType5", $.whenIsPesach(2012), "2012-04-07");
  assert_eq("CorrectDateInYearType6", $.whenIsPesach(2003), "2003-04-17");
  assert_eq("CorrectDateInYearType7", $.whenIsPesach(2000), "2000-04-20");
  assert_eq("CorrectDateInYearType8", $.whenIsPesach(2015), "2015-04-04");
  assert_eq("CorrectDateInYearType9", $.whenIsPesach(2029), "2029-03-31");
  assert_eq("CorrectDateInYearType10", $.whenIsPesach(2021), "2021-03-28");
  assert_eq("CorrectDateInYearType11", $.whenIsPesach(2010), "2010-03-30");
  assert_eq("CorrectDateInYearType12", $.whenIsPesach(2004), "2004-04-06");
  assert_eq("CorrectDateInYearType13", $.whenIsPesach(2002), "2002-03-28");
  assert_eq("CorrectDateInYearType14", $.whenIsPesach(2023), "2023-04-06");

  assert_eq("GregorianDivergenceOf12In1899", $.whenIsPesach(1899), "1899-03-26");
  assert_eq("GregorianDivergenceOf13In1900", $.whenIsPesach(1900), "1900-04-14");
  assert_eq("GregorianDivergenceOf13In2099", $.whenIsPesach(2099), "2099-04-05");
  assert_eq("GregorianDivergenceOf14In2100", $.whenIsPesach(2100), "2100-04-24");

  // Test boundary cases of DMZ
  assert_day_of_week("516 misses DMZ by 45 halakim", $.whenIsPesach(516), 6);
  assert_day_of_week("4048 makes DMZ with 79 halakim to spare", $.whenIsPesach(4048), 0);

  // Test boundary cases of DMZ + ADU
  assert_day_of_week("146 misses DMZ+ADU by 13 halakim", $.whenIsPesach(146), 2);
  assert_day_of_week("3682 makes DMZ+ADU with 88 halakim to spare", $.whenIsPesach(3682), 2);

  // Test boundary cases of gatarad
  assert_day_of_week("519 misses Betutakpat by 68 halakim", $.whenIsPesach(519), 0);
  assert_day_of_week("3862 makes Betutakpat with 95 halakim to spare", $.whenIsPesach(3862), 2);

  // Test boundary cases of betutakpat
  assert_day_of_week("2174 misses Betutakpat by 143 halakim", $.whenIsPesach(2174), 6);
  assert_day_of_week("3683 makes Betutakpat with 89 halakim to spare", $.whenIsPesach(3683), 0);

  //isPesach() tests
  assert_false("ErevPesachIsNotPesach", $.isPesach("2012-04-06"));
  assert_true("Day1OfPesachIsPesach", $.isPesach("2012-04-07"));
  assert_true("Day2OfPesachIsPesach", $.isPesach("2012-04-08"));
  assert_true("Day3OfPesachIsPesach", $.isPesach("2012-04-09"));
  assert_true("Day4OfPesachIsPesach", $.isPesach("2012-04-10"));
  assert_true("Day5OfPesachIsPesach", $.isPesach("2012-04-11"));
  assert_true("Day6OfPesachIsPesach", $.isPesach("2012-04-12"));
  assert_true("Day7OfPesachIsPesach", $.isPesach("2012-04-13"));
  assert_true("Day8OfPesachIsPesach", $.isPesach("2012-04-14"));
  assert_false("DayAfterPesachIsNotPesach", $.isPesach("2012-04-15"));

  // isShavuot() tests
  assert_false("ErevShavuotIsNotShavuot", $.isShavuot("2012-05-26"));
  assert_true("Day1OfShavuotIsShavuot", $.isShavuot("2012-05-27"));
  assert_true("Day2OfShavuotIsShavuot", $.isShavuot("2012-05-28"));
  assert_false("DayAfterShavuotIsNotShavuot", $.isShavuot("2012-05-29"));

  // isRoshHashanah tests
  assert_false("ErevRoshHaShanahIsNotRoshHaShanah", $.isRoshHaShanah("2012-09-16"));
  assert_true("Day1OfRoshHaShanahIsRoshHaShanah", $.isRoshHashanah("2012-09-17"));
  assert_true("Day2OfRoshHaShanahIsRoshHaShanah", $.isRoshHaShanah("2012-09-18"));
  assert_false("DayAfterRoshHaShanahIsNotRoshHaShanah", $.isRoshHashanah("2012-09-19"));

  // isYomKippur() tests
  assert_false("ErevYomKippurIsNotYomKippur", $.isYomKippur("2012-09-25"));
  assert_true("YomKippurIsYomKippur", $.isYomKippur("2012-09-26"));
  assert_false("DayAfterYomKippurIsNotYomKippur", $.isYomKippur("2012-09-27"));

  // isSukkot() tests
  assert_false("ErevSukkotIsNotSukkot", $.isSukkot("2012-09-30"));
  assert_true("Day1OfSukkotIsSukkot", $.isSukkot("2012-10-01"));
  assert_true("Day2OfSukkotIsSukkot", $.isSukkot("2012-10-02"));
  assert_true("Day3OfSukkotIsSukkot", $.isSukkot("2012-10-03"));
  assert_true("Day4OfSukkotIsSukkot", $.isSukkot("2012-10-04"));
  assert_true("Day5OfSukkotIsSukkot", $.isSukkot("2012-10-05"));
  assert_true("Day6OfSukkotIsSukkot", $.isSukkot("2012-10-06"));
  assert_true("Day7OfSukkotIsSukkot", $.isSukkot("2012-10-07"));
  assert_true("Day8OfSukkotIsSukkot", $.isSukkot("2012-10-08"));
  assert_true("Day9OfSukkotIsSukkot", $.isSukkot("2012-10-09"));
  assert_false("DayAfterSukkotIsNotSukkot", $.isSukkot("2012-10-10"));

  // isMoed() tests
  assert_false("ErevPesachIsNotMoed", $.isMoed("2012-04-06"));
  assert_false("Day1OfPesachIsNotMoed", $.isMoed("2012-04-07"));
  assert_false("Day2OfPesachIsNotMoed", $.isMoed("2012-04-08"));
  assert_true("Day3OfPesachIsMoed", $.isMoed("2012-04-09"));
  assert_true("Day3OfPesachIsMoed", $.isMoed("2012-04-10"));
  assert_true("Day3OfPesachIsMoed", $.isMoed("2012-04-11"));
  assert_true("Day3OfPesachIsMoed", $.isMoed("2012-04-12"));
  assert_false("Day7OfPesachIsNotMoed", $.isMoed("2012-04-13"));
  assert_false("Day8OfPesachIsNotMoed", $.isMoed("2012-04-14"));
  assert_false("DayAfterPesachIsNotMoed", $.isMoed("2012-04-15"));

  assert_false("ErevShavuotIsNotMoed", $.isMoed("2012-05-26"));
  assert_false("Day1OfShavuotIsNotMoed", $.isMoed("2012-05-27"));
  assert_false("Day2OfShavuotIsNotMoed", $.isMoed("2012-05-28"));
  assert_false("DayAfterShavuotIsNotMoed", $.isMoed("2012-05-29"));

  assert_false("ErevRoshHaShanahIsNotMoed", $.isMoed("2012-09-16"));
  assert_false("Day1OfRoshHaShanahIsNotMoed", $.isMoed("2012-09-17"));
  assert_false("Day2OfRoshHaShanahIsNotMoed", $.isMoed("2012-09-18"));
  assert_false("DayAfterRoshHaShanahIsNotMoed", $.isMoed("2012-09-19"));

  assert_false("ErevYomKippurIsNotMoed", $.isMoed("2012-09-25"));
  assert_false("YomKippurIsNotMoed", $.isMoed("2012-09-26"));
  assert_false("DayAfterYomKippurIsNotMoed", $.isMoed("2012-09-27"));

  assert_false("ErevSukkotIsNotMoed", $.isMoed("2012-09-30"));
  assert_false("Day1OfSukkotIsNotMoed", $.isMoed("2012-10-01"));
  assert_false("Day2OfSukkotIsNotMoed", $.isMoed("2012-10-02"));
  assert_true("Day3OfSukkotIsMoed", $.isMoed("2012-10-03"));
  assert_true("Day4OfSukkotIsMoed", $.isMoed("2012-10-04"));
  assert_true("Day5OfSukkotIsMoed", $.isMoed("2012-10-05"));
  assert_true("Day6OfSukkotIsMoed", $.isMoed("2012-10-06"));
  assert_true("Day7OfSukkotIsMoed", $.isMoed("2012-10-07"));
  assert_false("Day8OfSukkotIsMoed", $.isMoed("2012-10-08"));
  assert_false("Day9OfSukkotIsMoed", $.isMoed("2012-10-09"));
  assert_false("DayAfterSukkotIsNotMoed", $.isMoed("2012-10-10"));

  // isRegel() tests
  assert_false("ErevPesachIsNotRegel", $.isRegel("2012-04-06"));
  assert_true("Day1OfPesachIsRegel", $.isRegel("2012-04-07"));
  assert_true("Day2OfPesachIsRegel", $.isRegel("2012-04-08"));
  assert_true("Day3OfPesachIsRegel", $.isRegel("2012-04-09"));
  assert_true("Day4OfPesachIsRegel", $.isRegel("2012-04-10"));
  assert_true("Day5OfPesachIsRegel", $.isRegel("2012-04-11"));
  assert_true("Day6OfPesachIsRegel", $.isRegel("2012-04-12"));
  assert_true("Day7OfPesachIsRegel", $.isRegel("2012-04-13"));
  assert_true("Day8OfPesachIsRegel", $.isRegel("2012-04-14"));
  assert_false("DayAfterPesachIsNotRegel", $.isRegel("2012-04-15"));

  assert_false("ErevShavuotIsNotRegel", $.isRegel("2012-05-26"));
  assert_true("Day1OfShavuotIsRegel", $.isRegel("2012-05-27"));
  assert_true("Day2OfShavuotIsRegel", $.isRegel("2012-05-28"));
  assert_false("DayAfterShavuotIsNotRegel", $.isRegel("2012-05-29"));

  assert_false("ErevRoshHaShanahIsNotRegel", $.isRegel("2012-09-16"));
  assert_false("Day1OfRoshHaShanahIsNotRegel", $.isRegel("2012-09-17"));
  assert_false("Day2OfRoshHaShanahIsNotRegel", $.isRegel("2012-09-18"));
  assert_false("DayAfterRoshHaShanahIsNotRegel", $.isRegel("2012-09-19"));

  assert_false("ErevYomKippurIsNotRegel", $.isRegel("2012-09-25"));
  assert_false("YomKippurIsNotRegel", $.isRegel("2012-09-26"));
  assert_false("DayAfterYomKippurIsNotRegel", $.isRegel("2012-09-27"));

  assert_false("ErevSukkotIsNotRegel", $.isRegel("2012-09-30"));
  assert_true("Day1OfSukkotIsRegel", $.isRegel("2012-10-01"));
  assert_true("Day2OfSukkotIsRegel", $.isRegel("2012-10-02"));
  assert_true("Day3OfSukkotIsRegel", $.isRegel("2012-10-03"));
  assert_true("Day4OfSukkotIsRegel", $.isRegel("2012-10-04"));
  assert_true("Day5OfSukkotIsRegel", $.isRegel("2012-10-05"));
  assert_true("Day6OfSukkotIsRegel", $.isRegel("2012-10-06"));
  assert_true("Day7OfSukkotIsRegel", $.isRegel("2012-10-07"));
  assert_true("Day8OfSukkotIsRegel", $.isRegel("2012-10-08"));
  assert_true("Day9OfSukkotIsRegel", $.isRegel("2012-10-09"));
  assert_false("DayAfterSukkotIsNotSukkot", $.isRegel("2012-10-10"));

  // isYomTov() tests
  assert_false("ErevPesachIsNotYomTov", $.isYomTov("2012-04-06"));
  assert_true("Day1OfPesachIsYomTov", $.isYomTov("2012-04-07"));
  assert_true("Day2OfPesachIsYomTov", $.isYomTov("2012-04-08"));
  assert_false("Day3OfPesachIsNotYomTov", $.isYomTov("2012-04-09"));
  assert_false("Day3OfPesachIsNotYomTov", $.isYomTov("2012-04-10"));
  assert_false("Day3OfPesachIsNotYomTov", $.isYomTov("2012-04-11"));
  assert_false("Day3OfPesachIsNotYomTov", $.isYomTov("2012-04-12"));
  assert_true("Day7OfPesachIsYomTov", $.isYomTov("2012-04-13"));
  assert_true("Day8OfPesachIsYomTov", $.isYomTov("2012-04-14"));
  assert_false("DayAfterPesachIsNotYomTov", $.isYomTov("2012-04-15"));

  assert_false("ErevShavuotIsNotYomTov", $.isYomTov("2012-05-26"));
  assert_true("Day1OfShavuotIsYomTov", $.isYomTov("2012-05-27"));
  assert_true("Day2OfShavuotIsYomTov", $.isYomTov("2012-05-28"));
  assert_false("DayAfterShavuotIsNotYomTov", $.isYomTov("2012-05-29"));

  assert_false("ErevRoshHaShanahIsNotYomTov", $.isYomTov("2012-09-16"));
  assert_true("Day1OfRoshHaShanahIsYomTov", $.isYomTov("2012-09-17"));
  assert_true("Day2OfRoshHaShanahIsYomTov", $.isYomTov("2012-09-18"));
  assert_false("DayAfterRoshHaShanahIsNotYomTov", $.isYomTov("2012-09-19"));

  assert_false("ErevYomKippurIsNotYomTov", $.isYomTov("2012-09-25"));
  assert_false("YomKippurIsNotYomTov", $.isYomTov("2012-09-26"));
  assert_false("DayAfterYomKippurIsNotYomTov", $.isYomTov("2012-09-27"));

  assert_false("ErevSukkotIsNotYomTov", $.isYomTov("2012-09-30"));
  assert_true("Day1OfSukkotIsYomTov", $.isYomTov("2012-10-01"));
  assert_true("Day2OfSukkotIsYomTov", $.isYomTov("2012-10-02"));
  assert_false("Day3OfSukkotIsNotYomTov", $.isYomTov("2012-10-03"));
  assert_false("Day4OfSukkotIsNotYomTov", $.isYomTov("2012-10-04"));
  assert_false("Day5OfSukkotIsNotYomTov", $.isYomTov("2012-10-05"));
  assert_false("Day6OfSukkotIsNotYomTov", $.isYomTov("2012-10-06"));
  assert_false("Day7OfSukkotIsNotYomTov", $.isYomTov("2012-10-07"));
  assert_true("Day8OfSukkotIsYomTov", $.isYomTov("2012-10-08"));
  assert_true("Day9OfSukkotIsYomTov", $.isYomTov("2012-10-09"));
  assert_false("DayAfterSukkotIsNotYomTov", $.isYomTov("2012-10-10"));

  output += "<div style=\"color:black;\">" + tests + " tests</div>";
  output += "<div style=\"color:green;\">" + passing + " passed</div>";
  output += "<div style=\"color:red;\">" + failing + " failed</div>";

  $('#test_results').html(output);
});



