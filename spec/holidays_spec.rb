require 'hebcal/holidays' 

describe "holiday test" do
  include HebCal::Holidays

  it "should know when Pesach is" do
    IsPesach(Time.new(2012, 4, 6)).should == false
    IsPesach(Time.new(2012, 4, 7)).should == true
    IsPesach(Time.new(2012, 4, 8)).should == true
    IsPesach(Time.new(2012, 4, 9)).should == true
    IsPesach(Time.new(2012, 4, 10)).should == true
    IsPesach(Time.new(2012, 4, 11)).should == true
    IsPesach(Time.new(2012, 4, 12)).should == true
    IsPesach(Time.new(2012, 4, 13)).should == true
    IsPesach(Time.new(2012, 4, 14)).should == true
    IsPesach(Time.new(2012, 4, 15)).should == false
  end

  it "should know when Shavuot is" do
    IsShavuot(Time.new(2012, 5, 26)).should == false
    IsShavuot(Time.new(2012, 5, 27)).should == true
    IsShavuot(Time.new(2012, 5, 28)).should == true
    IsShavuot(Time.new(2012, 5, 29)).should == false
  end

  it "should know when Rosh HaShanah is" do
    IsRoshHaShanah(Time.new(2012, 9, 16)).should == false
    IsRoshHashanah(Time.new(2012, 9, 17)).should == true
    IsRoshHaShanah(Time.new(2012, 9, 18)).should == true
    IsRoshHashanah(Time.new(2012, 9, 19)).should == false
  end

  it "should know when Yom Kippur is" do
    IsYomKippur(Time.new(2012, 9, 25)).should == false
    IsYomKippur(Time.new(2012, 9, 26)).should == true
    IsYomKippur(Time.new(2012, 9, 27)).should == false
  end

  it "should know when Sukkot is" do
    IsSukkot(Time.new(2012, 9, 30)).should == false
    IsSukkot(Time.new(2012, 10, 1)).should == true
    IsSukkot(Time.new(2012, 10, 2)).should == true
    IsSukkot(Time.new(2012, 10, 3)).should == true
    IsSukkot(Time.new(2012, 10, 4)).should == true
    IsSukkot(Time.new(2012, 10, 5)).should == true
    IsSukkot(Time.new(2012, 10, 6)).should == true
    IsSukkot(Time.new(2012, 10, 7)).should == true
    IsSukkot(Time.new(2012, 10, 8)).should == true
    IsSukkot(Time.new(2012, 10, 9)).should == true
    IsSukkot(Time.new(2012, 10, 10)).should == false
  end

  it "should know which parts of Pesach are Moed" do
    IsMoed(Time.new(2012, 4, 6)).should == false
    IsMoed(Time.new(2012, 4, 7)).should == false
    IsMoed(Time.new(2012, 4, 8)).should == false
    IsMoed(Time.new(2012, 4, 9)).should == true
    IsMoed(Time.new(2012, 4, 10)).should == true
    IsMoed(Time.new(2012, 4, 11)).should == true
    IsMoed(Time.new(2012, 4, 12)).should == true
    IsMoed(Time.new(2012, 4, 13)).should == false
    IsMoed(Time.new(2012, 4, 14)).should == false
    IsMoed(Time.new(2012, 4, 15)).should == false
  end

  it "should know that Shavuot is not a Moed" do
    IsMoed(Time.new(2012, 5, 26)).should == false
    IsMoed(Time.new(2012, 5, 27)).should == false
    IsMoed(Time.new(2012, 5, 28)).should == false
    IsMoed(Time.new(2012, 5, 29)).should == false
  end

  it "should know that Rosh HaShanah is not a Moed" do
    IsMoed(Time.new(2012, 9, 16)).should == false
    IsMoed(Time.new(2012, 9, 17)).should == false
    IsMoed(Time.new(2012, 9, 18)).should == false
    IsMoed(Time.new(2012, 9, 19)).should == false
  end

  it "should know that Yom Kippur is not a Moed" do
    IsMoed(Time.new(2012, 9, 25)).should == false
    IsMoed(Time.new(2012, 9, 26)).should == false
    IsMoed(Time.new(2012, 9, 27)).should == false
  end

  it "should know which parts of Sukkot are Moed" do
    IsMoed(Time.new(2012, 9, 30)).should == false
    IsMoed(Time.new(2012, 10, 1)).should == false
    IsMoed(Time.new(2012, 10, 2)).should == false
    IsMoed(Time.new(2012, 10, 3)).should == true
    IsMoed(Time.new(2012, 10, 4)).should == true
    IsMoed(Time.new(2012, 10, 5)).should == true
    IsMoed(Time.new(2012, 10, 6)).should == true
    IsMoed(Time.new(2012, 10, 7)).should == true
    IsMoed(Time.new(2012, 10, 8)).should == false
    IsMoed(Time.new(2012, 10, 9)).should == false
    IsMoed(Time.new(2012, 10, 10)).should == false
  end

  it "should know that Pesach is a Regel" do
    IsRegel(Time.new(2012, 4, 6)).should == false
    IsRegel(Time.new(2012, 4, 7)).should == true
    IsRegel(Time.new(2012, 4, 8)).should == true
    IsRegel(Time.new(2012, 4, 9)).should == true
    IsRegel(Time.new(2012, 4, 10)).should == true
    IsRegel(Time.new(2012, 4, 11)).should == true
    IsRegel(Time.new(2012, 4, 12)).should == true
    IsRegel(Time.new(2012, 4, 13)).should == true
    IsRegel(Time.new(2012, 4, 14)).should == true
    IsRegel(Time.new(2012, 4, 15)).should == false
  end

  it "should know that Shavuot is a Regel" do
    IsRegel(Time.new(2012, 5, 26)).should == false
    IsRegel(Time.new(2012, 5, 27)).should == true
    IsRegel(Time.new(2012, 5, 28)).should == true
    IsRegel(Time.new(2012, 5, 29)).should == false
  end

  it "should know that Rosh HaShanah is not a Regel" do
    IsRegel(Time.new(2012, 9, 16)).should == false
    IsRegel(Time.new(2012, 9, 17)).should == false
    IsRegel(Time.new(2012, 9, 18)).should == false
    IsRegel(Time.new(2012, 9, 19)).should == false
  end

  it "should know that Yom Kippur is not a Regel" do
    IsRegel(Time.new(2012, 9, 25)).should == false
    IsRegel(Time.new(2012, 9, 26)).should == false
    IsRegel(Time.new(2012, 9, 27)).should == false
  end

  it "should know that Sukkot is a Regel" do
    IsRegel(Time.new(2012, 9, 30)).should == false
    IsRegel(Time.new(2012, 10, 1)).should == true
    IsRegel(Time.new(2012, 10, 2)).should == true
    IsRegel(Time.new(2012, 10, 3)).should == true
    IsRegel(Time.new(2012, 10, 4)).should == true
    IsRegel(Time.new(2012, 10, 5)).should == true
    IsRegel(Time.new(2012, 10, 6)).should == true
    IsRegel(Time.new(2012, 10, 7)).should == true
    IsRegel(Time.new(2012, 10, 8)).should == true
    IsRegel(Time.new(2012, 10, 9)).should == true
    IsRegel(Time.new(2012, 10, 10)).should == false
  end

  it "should know which parts of Pesach are Yom Tov" do
    IsYomTov(Time.new(2012, 4, 6)).should == false
    IsYomTov(Time.new(2012, 4, 7)).should == true
    IsYomTov(Time.new(2012, 4, 8)).should == true
    IsYomTov(Time.new(2012, 4, 9)).should == false
    IsYomTov(Time.new(2012, 4, 10)).should == false
    IsYomTov(Time.new(2012, 4, 11)).should == false
    IsYomTov(Time.new(2012, 4, 12)).should == false
    IsYomTov(Time.new(2012, 4, 13)).should == true
    IsYomTov(Time.new(2012, 4, 14)).should == true
    IsYomTov(Time.new(2012, 4, 15)).should == false
  end

  it "should know that Shavuot is Yom Tov" do
    IsYomTov(Time.new(2012, 5, 26)).should == false
    IsYomTov(Time.new(2012, 5, 27)).should == true
    IsYomTov(Time.new(2012, 5, 28)).should == true
    IsYomTov(Time.new(2012, 5, 29)).should == false
  end

  it "should know that Rosh HaShanah is Yom Tov" do
    IsYomTov(Time.new(2012, 9, 16)).should == false
    IsYomTov(Time.new(2012, 9, 17)).should == true
    IsYomTov(Time.new(2012, 9, 18)).should == true
    IsYomTov(Time.new(2012, 9, 19)).should == false
  end

  it "should know that Yom Kippur is not Yom Tov" do
    IsYomTov(Time.new(2012, 9, 25)).should == false
    IsYomTov(Time.new(2012, 9, 26)).should == false
    IsYomTov(Time.new(2012, 9, 27)).should == false
  end

  it "should know which parts of Sukkot are Yom Tov" do
    IsYomTov(Time.new(2012, 9, 30)).should == false
    IsYomTov(Time.new(2012, 10, 1)).should == true
    IsYomTov(Time.new(2012, 10, 2)).should == true
    IsYomTov(Time.new(2012, 10, 3)).should == false
    IsYomTov(Time.new(2012, 10, 4)).should == false
    IsYomTov(Time.new(2012, 10, 5)).should == false
    IsYomTov(Time.new(2012, 10, 6)).should == false
    IsYomTov(Time.new(2012, 10, 7)).should == false
    IsYomTov(Time.new(2012, 10, 8)).should == true
    IsYomTov(Time.new(2012, 10, 9)).should == true
    IsYomTov(Time.new(2012, 10, 10)).should == false
  end

  it "should know when Purim is" do
    IsPurim(Time.new(2015, 3, 4)).should == false
    IsPurim(Time.new(2015, 3, 5)).should == true
    IsPurim(Time.new(2015, 3, 6)).should == false
  end

  it "should know when Hanukah is in a 353 day year" do
    IsHanuka(Time.new(2043, 12, 26)).should == false
    IsHanukah(Time.new(2043, 12, 27)).should == true
    IsHanukka(Time.new(2043, 12, 28)).should == true
    IsHanukkah(Time.new(2043, 12, 29)).should == true
    IsChanuka(Time.new(2043, 12, 30)).should == true
    IsChanukka(Time.new(2043, 12, 31)).should == true
    IsChanukah(Time.new(2044, 1, 1)).should == true
    IsChanukka(Time.new(2044, 1, 2)).should == true
    IsHanukka(Time.new(2044, 1, 3)).should == true
    IsHanukka(Time.new(2044, 1, 4)).should == false
  end

  it "should know when Hanukah is in a 354 day year" do
    IsHanuka(Time.new(2014, 12, 16)).should == false
    IsHanukah(Time.new(2014, 12, 17)).should == true
    IsHanukka(Time.new(2014, 12, 18)).should == true
    IsHanukkah(Time.new(2014, 12, 19)).should == true
    IsChanuka(Time.new(2014, 12, 20)).should == true
    IsChanukah(Time.new(2014, 12, 21)).should == true
    IsChanukka(Time.new(2014, 12, 22)).should == true
    IsChanukkah(Time.new(2014, 12, 23)).should == true
    IsHanukka(Time.new(2014, 12, 24)).should == true
    IsHanukka(Time.new(2014, 12, 25)).should == false
  end

  it "should know when Hanukah is in a 355 day year" do
    IsHanuka(Time.new(2019, 12, 22)).should == false
    IsHanukah(Time.new(2019, 12, 23)).should == true
    IsHanukka(Time.new(2019, 12, 24)).should == true
    IsHanukkah(Time.new(2019, 12, 25)).should == true
    IsChanuka(Time.new(2019, 12, 26)).should == true
    IsChanukah(Time.new(2019, 12, 27)).should == true
    IsChanukka(Time.new(2019, 12, 28)).should == true
    IsChanukkah(Time.new(2019, 12, 29)).should == true
    IsHanukka(Time.new(2019, 12, 30)).should == true
    IsHanukka(Time.new(2019, 12, 31)).should == false
  end

  it "should know when Hanukah is in a 383 day year" do
    IsHanuka(Time.new(2023, 12, 7)).should == false
    IsHanukah(Time.new(2023, 12, 8)).should == true
    IsHanukka(Time.new(2023, 12, 9)).should == true
    IsHanukkah(Time.new(2023, 12, 10)).should == true
    IsChanuka(Time.new(2023, 12, 11)).should == true
    IsChanukah(Time.new(2023, 12, 12)).should == true
    IsChanukka(Time.new(2023, 12, 13)).should == true
    IsChanukkah(Time.new(2023, 12, 14)).should == true
    IsHanukka(Time.new(2023, 12, 15)).should == true
    IsHanukka(Time.new(2023, 12, 16)).should == false
  end

  it "should know when Hanukah is in a 384 day year" do
    IsHanuka(Time.new(2021, 11, 28)).should == false
    IsHanukah(Time.new(2021, 11, 29)).should == true
    IsHanukka(Time.new(2021, 11, 30)).should == true
    IsHanukkah(Time.new(2021, 12, 1)).should == true
    IsChanuka(Time.new(2021, 12, 2)).should == true
    IsChanukah(Time.new(2021, 12, 3)).should == true
    IsChanukka(Time.new(2021, 12, 4)).should == true
    IsChanukkah(Time.new(2021, 12, 5)).should == true
    IsHanukka(Time.new(2021, 12, 6)).should == true
    IsHanukka(Time.new(2021, 12, 7)).should == false
  end

  it "should know when Hanukah is in a 385 day year" do
    IsHanuka(Time.new(2015, 12, 6)).should == false
    IsHanukah(Time.new(2015, 12, 7)).should == true
    IsHanukka(Time.new(2015, 12, 8)).should == true
    IsHanukkah(Time.new(2015, 12, 9)).should == true
    IsChanuka(Time.new(2015, 12, 10)).should == true
    IsChanukah(Time.new(2015, 12, 11)).should == true
    IsChanukka(Time.new(2015, 12, 12)).should == true
    IsChanukkah(Time.new(2015, 12, 13)).should == true
    IsHanukka(Time.new(2015, 12, 14)).should == true
    IsHanukka(Time.new(2015, 12, 15)).should == false
  end

  it "should know when 10 Tevet is in a 353 day year" do
    Is10Tevet(Time.new(2044, 1, 9)).should == false
    Is10Tevet(Time.new(2044, 1, 10)).should == true
    Is10Tevet(Time.new(2044, 1, 11)).should == false
  end

  it "should know when 10 Tevet is in a 354 day year" do
    Is10Tevet(Time.new(2014, 12, 31)).should == false
    Is10Tevet(Time.new(2015, 1, 1)).should == true
    Is10Tevet(Time.new(2015, 1, 2)).should == false
  end

  it "should know when 10 Tevet is in a 355 day year" do
    Is10Tevet(Time.new(2020, 1, 6)).should == false
    Is10Tevet(Time.new(2020, 1, 7)).should == true
    Is10Tevet(Time.new(2020, 1, 8)).should == false
  end

  it "should know when 10 Tevet is in a 383 day year" do
    Is10Tevet(Time.new(2023, 12, 21)).should == false
    Is10Tevet(Time.new(2023, 12, 22)).should == true
    Is10Tevet(Time.new(2023, 12, 23)).should == false
  end

  it "should know when 10 Tevet is in a 384 day year" do
    Is10Tevet(Time.new(2021, 12, 13)).should == false
    Is10Tevet(Time.new(2021, 12, 14)).should == true
    Is10Tevet(Time.new(2021, 12, 15)).should == false
  end

  it "should know when 10 Tevet is in a 385 day year" do
    Is10Tevet(Time.new(2015, 12, 21)).should == false
    Is10Tevet(Time.new(2015, 12, 22)).should == true
    Is10Tevet(Time.new(2015, 12, 23)).should == false
  end

  it "should know when Taanit Ester is on a Monday" do
    IsTaanitEster(Time.new(2020, 3, 8)).should == false
    IsTaanitEster(Time.new(2020, 3, 9)).should == true
    IsTaanitEsther(Time.new(2020, 3, 10)).should == false
  end

  it "should know when Taanit Ester is on a Wednesday" do
    IsTaanitEster(Time.new(2022, 3, 15)).should == false
    IsTaanitEster(Time.new(2022, 3, 16)).should == true
    IsTaanitEsther(Time.new(2022, 3, 17)).should == false
  end

  it "should know when Taanit Ester is on a Thursday when Purim is on a Friday" do
    IsTaanitEster(Time.new(2021, 2, 24)).should == false
    IsTaanitEster(Time.new(2021, 2, 25)).should == true
    IsTaanitEsther(Time.new(2021, 2, 26)).should == false
  end

  it "should know when Taanit Ester is on a Thursday when Purim is on a Sunday" do
    IsTaanitEster(Time.new(2024, 3, 20)).should == false
    IsTaanitEster(Time.new(2024, 3, 21)).should == true
    IsTaanitEsther(Time.new(2024, 3, 22)).should == false
    IsTaanitEsther(Time.new(2024, 3, 23)).should == false
    IsTaanitEsther(Time.new(2024, 3, 24)).should == false
  end

  it "should know when 17 Tammuz is on a Tuesday" do
    Is17Tamuz(Time.new(2024, 7, 22)).should == false
    Is17Tammuz(Time.new(2024, 7, 23)).should == true
    Is17Tamuz(Time.new(2024, 7, 24)).should == false
  end

  it "should know when 17 Tammuz is on a Thursday" do
    Is17Tammuz(Time.new(2023, 7, 5)).should == false
    Is17Tamuz(Time.new(2023, 7, 6)).should == true
    Is17Tammuz(Time.new(2023, 7, 7)).should == false
  end

  it "should know when 17 Tammuz is on a Sunday when not postponed" do
    Is17Tamuz(Time.new(2021, 6, 26)).should == false
    Is17Tammuz(Time.new(2021, 6, 27)).should == true
    Is17Tamuz(Time.new(2021, 6, 28)).should == false
  end

  it "should know when 17 Tammuz is on a Sunday when postponed" do
    Is17Tammuz(Time.new(2022, 7, 15)).should == false
    Is17Tamuz(Time.new(2022, 7, 16)).should == false
    Is17Tammuz(Time.new(2022, 7, 17)).should == true
    Is17Tamuz(Time.new(2022, 7, 18)).should == false
  end

  it "should know when 9 Ab is on a Tuesday" do
    Is9Ab(Time.new(2024, 8, 12)).should == false
    Is9Av(Time.new(2024, 8, 13)).should == true
    Is9Ab(Time.new(2024, 8, 14)).should == false
  end

  it "should know when 9 Ab is on a Thursday" do
    Is9Av(Time.new(2023, 7, 26)).should == false
    Is9Ab(Time.new(2023, 7, 27)).should == true
    Is9Av(Time.new(2023, 7, 28)).should == false
  end

  it "should know when 9 Ab is on a Sunday when not postponed" do
    Is9Ab(Time.new(2021, 7, 17)).should == false
    Is9Av(Time.new(2021, 7, 18)).should == true
    Is9Ab(Time.new(2021, 7, 19)).should == false
  end

  it "should know when 9 Ab is on a Sunday when postponed" do
    Is9Av(Time.new(2022, 8, 5)).should == false
    Is9Ab(Time.new(2022, 8, 6)).should == false
    Is9Av(Time.new(2022, 8, 7)).should == true
    Is9Ab(Time.new(2022, 8, 8)).should == false
  end

  it "should know when Tzom Gedalia is on a Monday" do
    IsFastOfGedalia(Time.new(2023, 9, 17)).should == false
    IsFastOfGedaliah(Time.new(2023, 9, 18)).should == true
    IsTzomGedalia(Time.new(2023, 9, 19)).should == false
  end

  it "should know when Tzom Gedalia is on a Wednesday" do
    IsTzomGedaliah(Time.new(2022, 9, 27)).should == false
    IsFastOfGedalia(Time.new(2022, 9, 28)).should == true
    IsFastOfGedaliah(Time.new(2022, 9, 29)).should == false
  end

  it "should know when Tzom Gedalia is on a Thursday" do
    IsTzomGedalia(Time.new(2021, 9, 8)).should == false
    IsTzomGedaliah(Time.new(2021, 9, 9)).should == true
    IsFastOfGedalia(Time.new(2021, 9, 10)).should == false
  end

  it "should know when Tzom Gedalia is on a Sunday when postponed" do
    IsFastOfGedaliah(Time.new(2017, 9, 22)).should == false
    IsTzomGedalia(Time.new(2017, 9, 23)).should == false
    IsTzomGedaliah(Time.new(2017, 9, 24)).should == true
    IsFastOfGedalia(Time.new(2017, 9, 25)).should == false
  end

  it "should know that 10 Tevet is a Taanit" do
    IsTaanit(Time.new(2044, 1, 9)).should == false
    IsTaanit(Time.new(2044, 1, 10)).should == true
    IsTaanit(Time.new(2044, 1, 11)).should == false
    IsTaanit(Time.new(2014, 12, 31)).should == false
    IsTaanit(Time.new(2015, 1, 1)).should == true
    IsTaanit(Time.new(2015, 1, 2)).should == false
    IsTaanit(Time.new(2020, 1, 6)).should == false
    IsTaanit(Time.new(2020, 1, 7)).should == true
    IsTaanit(Time.new(2020, 1, 8)).should == false
    IsTaanit(Time.new(2023, 12, 21)).should == false
    IsTaanit(Time.new(2023, 12, 22)).should == true
    IsTaanit(Time.new(2023, 12, 23)).should == false
    IsTaanit(Time.new(2021, 12, 13)).should == false
    IsTaanit(Time.new(2021, 12, 14)).should == true
    IsTaanit(Time.new(2021, 12, 15)).should == false
    IsTaanit(Time.new(2015, 12, 21)).should == false
    IsTaanit(Time.new(2015, 12, 22)).should == true
    IsTaanit(Time.new(2015, 12, 23)).should == false
  end

  it "should know that Taanit Ester is a Taanit" do
    IsTaanit(Time.new(2020, 3, 8)).should == false
    IsTaanit(Time.new(2020, 3, 9)).should == true
    IsTaanit(Time.new(2020, 3, 10)).should == false
    IsTaanit(Time.new(2022, 3, 15)).should == false
    IsTaanit(Time.new(2022, 3, 16)).should == true
    IsTaanit(Time.new(2022, 3, 17)).should == false
    IsTaanit(Time.new(2021, 2, 24)).should == false
    IsTaanit(Time.new(2021, 2, 25)).should == true
    IsTaanit(Time.new(2021, 2, 26)).should == false
    IsTaanit(Time.new(2024, 3, 20)).should == false
    IsTaanit(Time.new(2024, 3, 21)).should == true
    IsTaanit(Time.new(2024, 3, 22)).should == false
    IsTaanit(Time.new(2024, 3, 23)).should == false
    IsTaanit(Time.new(2024, 3, 24)).should == false
  end

  it "should know that 17 Tammuz is a Taanit" do
    IsTaanit(Time.new(2024, 7, 22)).should == false
    IsTaanit(Time.new(2024, 7, 23)).should == true
    IsTaanit(Time.new(2024, 7, 24)).should == false
    IsTaanit(Time.new(2023, 7, 5)).should == false
    IsTaanit(Time.new(2023, 7, 6)).should == true
    IsTaanit(Time.new(2023, 7, 7)).should == false
    IsTaanit(Time.new(2021, 6, 26)).should == false
    IsTaanit(Time.new(2021, 6, 27)).should == true
    IsTaanit(Time.new(2021, 6, 28)).should == false
    IsTaanit(Time.new(2022, 7, 15)).should == false
    IsTaanit(Time.new(2022, 7, 16)).should == false
    IsTaanit(Time.new(2022, 7, 17)).should == true
    IsTaanit(Time.new(2022, 7, 18)).should == false
  end

  it "should know that 9 Ab is a Taanit" do
    IsTaanit(Time.new(2024, 8, 12)).should == false
    IsTaanit(Time.new(2024, 8, 13)).should == true
    IsTaanit(Time.new(2024, 8, 14)).should == false
    IsTaanit(Time.new(2023, 7, 26)).should == false
    IsTaanit(Time.new(2023, 7, 27)).should == true
    IsTaanit(Time.new(2023, 7, 28)).should == false
    IsTaanit(Time.new(2021, 7, 17)).should == false
    IsTaanit(Time.new(2021, 7, 18)).should == true
    IsTaanit(Time.new(2021, 7, 19)).should == false
    IsTaanit(Time.new(2022, 8, 5)).should == false
    IsTaanit(Time.new(2022, 8, 6)).should == false
    IsTaanit(Time.new(2022, 8, 7)).should == true
    IsTaanit(Time.new(2022, 8, 8)).should == false
  end

  it "should know that Tzom Gedalia is a Taanit" do
    IsTaanit(Time.new(2023, 9, 17)).should == false
    IsTaanit(Time.new(2023, 9, 18)).should == true
    IsTaanit(Time.new(2023, 9, 19)).should == false
    IsTaanit(Time.new(2022, 9, 27)).should == false
    IsTaanit(Time.new(2022, 9, 28)).should == true
    IsTaanit(Time.new(2022, 9, 29)).should == false
    IsTaanit(Time.new(2021, 9, 8)).should == false
    IsTaanit(Time.new(2021, 9, 9)).should == true
    IsTaanit(Time.new(2021, 9, 10)).should == false
    IsTaanit(Time.new(2017, 9, 22)).should == false
    IsTaanit(Time.new(2017, 9, 23)).should == false
    IsTaanit(Time.new(2017, 9, 24)).should == true
    IsTaanit(Time.new(2017, 9, 25)).should == false
  end

  it "should know when Rosh Chodesh is in a 353 day year" do
    IsRoshHodesh(Time.new(2043, 5, 9)).should == false
    IsRoshChodesh(Time.new(2043, 5, 10)).should == true
    IsRoshHodesh(Time.new(2043, 5, 11)).should == true
    IsRoshChodesh(Time.new(2043, 5, 12)).should == false
    IsRoshHodesh(Time.new(2043, 6, 8)).should == false
    IsRoshChodesh(Time.new(2043, 6, 9)).should == true
    IsRoshHodesh(Time.new(2043, 6, 10)).should == false
    IsRoshChodesh(Time.new(2043, 7, 7)).should == false
    IsRoshHodesh(Time.new(2043, 7, 8)).should == true
    IsRoshChodesh(Time.new(2043, 7, 9)).should == true
    IsRoshHodesh(Time.new(2043, 7, 10)).should == false
    IsRoshChodesh(Time.new(2043, 8, 6)).should == false
    IsRoshHodesh(Time.new(2043, 8, 7)).should == true
    IsRoshChodesh(Time.new(2043, 8, 8)).should == false
    IsRoshHodesh(Time.new(2043, 9, 4)).should == false
    IsRoshChodesh(Time.new(2043, 9, 5)).should == true
    IsRoshHodesh(Time.new(2043, 9, 6)).should == true
    IsRoshChodesh(Time.new(2043, 9, 7)).should == false
    IsRoshHodesh(Time.new(2043, 10, 4)).should == false
    IsRoshChodesh(Time.new(2043, 10, 5)).should == false
    IsRoshHodesh(Time.new(2043, 10, 6)).should == false
    IsRoshChodesh(Time.new(2043, 11, 2)).should == false
    IsRoshHodesh(Time.new(2043, 11, 3)).should == true
    IsRoshChodesh(Time.new(2043, 11, 4)).should == true
    IsRoshHodesh(Time.new(2043, 11, 5)).should == false
    IsRoshChodesh(Time.new(2043, 12, 2)).should == false
    IsRoshHodesh(Time.new(2043, 12, 3)).should == true
    IsRoshChodesh(Time.new(2043, 12, 4)).should == false
    IsRoshHodesh(Time.new(2043, 12, 31)).should == false
    IsRoshChodesh(Time.new(2044, 1, 1)).should == true
    IsRoshHodesh(Time.new(2044, 1, 2)).should == false
    IsRoshChodesh(Time.new(2044, 1, 29)).should == false
    IsRoshHodesh(Time.new(2044, 1, 30)).should == true
    IsRoshChodesh(Time.new(2044, 1, 31)).should == false
    IsRoshHodesh(Time.new(2044, 2, 27)).should == false
    IsRoshChodesh(Time.new(2044, 2, 28)).should == true
    IsRoshHodesh(Time.new(2044, 2, 29)).should == true
    IsRoshChodesh(Time.new(2044, 3, 1)).should == false
    IsRoshHodesh(Time.new(2044, 3, 28)).should == false
    IsRoshChodesh(Time.new(2044, 3, 29)).should == true
    IsRoshHodesh(Time.new(2044, 3, 30)).should == false
  end

  it "should know when Rosh Chodesh is in a 354 day year" do
    IsRoshHodesh(Time.new(2041, 4, 30)).should == false
    IsRoshChodesh(Time.new(2041, 5, 1)).should == true
    IsRoshHodesh(Time.new(2041, 5, 2)).should == true
    IsRoshChodesh(Time.new(2041, 5, 3)).should == false
    IsRoshHodesh(Time.new(2041, 5, 30)).should == false
    IsRoshChodesh(Time.new(2041, 5, 31)).should == true
    IsRoshHodesh(Time.new(2041, 6, 1)).should == false
    IsRoshChodesh(Time.new(2041, 6, 28)).should == false
    IsRoshHodesh(Time.new(2041, 6, 29)).should == true
    IsRoshChodesh(Time.new(2041, 6, 30)).should == true
    IsRoshHodesh(Time.new(2041, 7, 1)).should == false
    IsRoshChodesh(Time.new(2041, 7, 28)).should == false
    IsRoshHodesh(Time.new(2041, 7, 29)).should == true
    IsRoshChodesh(Time.new(2041, 7, 30)).should == false
    IsRoshHodesh(Time.new(2041, 8, 26)).should == false
    IsRoshChodesh(Time.new(2041, 8, 27)).should == true
    IsRoshHodesh(Time.new(2041, 8, 28)).should == true
    IsRoshChodesh(Time.new(2041, 8, 29)).should == false
    IsRoshHodesh(Time.new(2041, 9, 25)).should == false
    IsRoshChodesh(Time.new(2041, 9, 26)).should == false
    IsRoshHodesh(Time.new(2041, 9, 27)).should == false
    IsRoshChodesh(Time.new(2041, 10, 24)).should == false
    IsRoshHodesh(Time.new(2041, 10, 25)).should == true
    IsRoshChodesh(Time.new(2041, 10, 26)).should == true
    IsRoshHodesh(Time.new(2041, 10, 27)).should == false
    IsRoshChodesh(Time.new(2041, 11, 23)).should == false
    IsRoshHodesh(Time.new(2041, 11, 24)).should == true
    IsRoshChodesh(Time.new(2041, 11, 25)).should == false
    IsRoshHodesh(Time.new(2041, 12, 22)).should == false
    IsRoshChodesh(Time.new(2041, 12, 23)).should == true
    IsRoshHodesh(Time.new(2041, 12, 24)).should == true
    IsRoshChodesh(Time.new(2041, 12, 25)).should == false
    IsRoshHodesh(Time.new(2042, 1, 21)).should == false
    IsRoshChodesh(Time.new(2042, 1, 22)).should == true
    IsRoshHodesh(Time.new(2042, 1, 23)).should == false
    IsRoshChodesh(Time.new(2042, 2, 19)).should == false
    IsRoshHodesh(Time.new(2042, 2, 20)).should == true
    IsRoshChodesh(Time.new(2042, 2, 21)).should == true
    IsRoshHodesh(Time.new(2042, 2, 22)).should == false
    IsRoshChodesh(Time.new(2042, 3, 21)).should == false
    IsRoshHodesh(Time.new(2042, 3, 22)).should == true
    IsRoshChodesh(Time.new(2042, 3, 23)).should == false
  end

  it "should know when Rosh Chodesh is in a 355 day year" do
    IsRoshHodesh(Time.new(2044, 4, 26)).should == false
    IsRoshChodesh(Time.new(2044, 4, 27)).should == true
    IsRoshHodesh(Time.new(2044, 4, 28)).should == true
    IsRoshChodesh(Time.new(2044, 4, 29)).should == false
    IsRoshHodesh(Time.new(2044, 5, 26)).should == false
    IsRoshChodesh(Time.new(2044, 5, 27)).should == true
    IsRoshHodesh(Time.new(2044, 5, 28)).should == false
    IsRoshChodesh(Time.new(2044, 6, 24)).should == false
    IsRoshHodesh(Time.new(2044, 6, 25)).should == true
    IsRoshChodesh(Time.new(2044, 6, 26)).should == true
    IsRoshHodesh(Time.new(2044, 6, 27)).should == false
    IsRoshChodesh(Time.new(2044, 7, 24)).should == false
    IsRoshHodesh(Time.new(2044, 7, 25)).should == true
    IsRoshChodesh(Time.new(2044, 7, 26)).should == false
    IsRoshHodesh(Time.new(2044, 8, 22)).should == false
    IsRoshChodesh(Time.new(2044, 8, 23)).should == true
    IsRoshHodesh(Time.new(2044, 8, 24)).should == true
    IsRoshChodesh(Time.new(2044, 8, 25)).should == false
    IsRoshHodesh(Time.new(2044, 9, 21)).should == false
    IsRoshChodesh(Time.new(2044, 9, 22)).should == false
    IsRoshHodesh(Time.new(2044, 9, 23)).should == false
    IsRoshChodesh(Time.new(2044, 10, 20)).should == false
    IsRoshHodesh(Time.new(2044, 10, 21)).should == true
    IsRoshChodesh(Time.new(2044, 10, 22)).should == true
    IsRoshHodesh(Time.new(2044, 10, 23)).should == false
    IsRoshChodesh(Time.new(2044, 11, 19)).should == false
    IsRoshHodesh(Time.new(2044, 11, 20)).should == true
    IsRoshChodesh(Time.new(2044, 11, 21)).should == true
    IsRoshHodesh(Time.new(2044, 11, 22)).should == false
    IsRoshChodesh(Time.new(2044, 12, 19)).should == false
    IsRoshHodesh(Time.new(2044, 12, 20)).should == true
    IsRoshChodesh(Time.new(2044, 12, 21)).should == true
    IsRoshHodesh(Time.new(2044, 12, 22)).should == false
    IsRoshChodesh(Time.new(2045, 1, 18)).should == false
    IsRoshHodesh(Time.new(2045, 1, 19)).should == true
    IsRoshChodesh(Time.new(2045, 1, 20)).should == false
    IsRoshHodesh(Time.new(2045, 2, 16)).should == false
    IsRoshChodesh(Time.new(2045, 2, 17)).should == true
    IsRoshHodesh(Time.new(2045, 2, 18)).should == true
    IsRoshChodesh(Time.new(2045, 2, 19)).should == false
    IsRoshHodesh(Time.new(2045, 3, 18)).should == false
    IsRoshChodesh(Time.new(2045, 3, 19)).should == true
    IsRoshHodesh(Time.new(2045, 3, 20)).should == false
  end

  it "should know when Rosh Chodesh is in a 383 day year" do
    IsRoshHodesh(Time.new(2040, 4, 12)).should == false
    IsRoshChodesh(Time.new(2040, 4, 13)).should == true
    IsRoshHodesh(Time.new(2040, 4, 14)).should == true
    IsRoshChodesh(Time.new(2040, 4, 15)).should == false
    IsRoshHodesh(Time.new(2040, 5, 12)).should == false
    IsRoshChodesh(Time.new(2040, 5, 13)).should == true
    IsRoshHodesh(Time.new(2040, 5, 14)).should == false
    IsRoshChodesh(Time.new(2040, 6, 10)).should == false
    IsRoshHodesh(Time.new(2040, 6, 11)).should == true
    IsRoshChodesh(Time.new(2040, 6, 12)).should == true
    IsRoshHodesh(Time.new(2040, 6, 13)).should == false
    IsRoshChodesh(Time.new(2040, 7, 10)).should == false
    IsRoshHodesh(Time.new(2040, 7, 11)).should == true
    IsRoshChodesh(Time.new(2040, 7, 12)).should == false
    IsRoshHodesh(Time.new(2040, 8, 8)).should == false
    IsRoshChodesh(Time.new(2040, 8, 9)).should == true
    IsRoshHodesh(Time.new(2040, 8, 10)).should == true
    IsRoshChodesh(Time.new(2040, 8, 11)).should == false
    IsRoshHodesh(Time.new(2040, 9, 7)).should == false
    IsRoshChodesh(Time.new(2040, 9, 8)).should == false
    IsRoshHodesh(Time.new(2040, 9, 9)).should == false
    IsRoshChodesh(Time.new(2040, 10, 6)).should == false
    IsRoshHodesh(Time.new(2040, 10, 7)).should == true
    IsRoshChodesh(Time.new(2040, 10, 8)).should == true
    IsRoshHodesh(Time.new(2040, 10, 9)).should == false
    IsRoshChodesh(Time.new(2040, 11, 5)).should == false
    IsRoshHodesh(Time.new(2040, 11, 6)).should == true
    IsRoshChodesh(Time.new(2040, 11, 7)).should == false
    IsRoshHodesh(Time.new(2040, 12, 4)).should == false
    IsRoshChodesh(Time.new(2040, 12, 5)).should == true
    IsRoshHodesh(Time.new(2040, 12, 6)).should == false
    IsRoshChodesh(Time.new(2041, 1, 2)).should == false
    IsRoshHodesh(Time.new(2041, 1, 3)).should == true
    IsRoshChodesh(Time.new(2041, 1, 4)).should == false
    IsRoshHodesh(Time.new(2041, 1, 31)).should == false
    IsRoshChodesh(Time.new(2041, 2, 1)).should == true
    IsRoshHodesh(Time.new(2041, 2, 2)).should == true
    IsRoshChodesh(Time.new(2041, 2, 3)).should == false
    IsRoshHodesh(Time.new(2041, 3, 2)).should == false
    IsRoshChodesh(Time.new(2041, 3, 3)).should == true
    IsRoshHodesh(Time.new(2041, 3, 4)).should == true
    IsRoshChodesh(Time.new(2041, 3, 5)).should == false
    IsRoshHodesh(Time.new(2041, 4, 1)).should == false
    IsRoshChodesh(Time.new(2041, 4, 2)).should == true
    IsRoshHodesh(Time.new(2041, 4, 3)).should == false
  end

  it "should know when Rosh Chodesh is in a 384 day year" do
    IsRoshHodesh(Time.new(2021, 4, 11)).should == false
    IsRoshChodesh(Time.new(2021, 4, 12)).should == true
    IsRoshHodesh(Time.new(2021, 4, 13)).should == true
    IsRoshChodesh(Time.new(2021, 4, 14)).should == false
    IsRoshHodesh(Time.new(2021, 5, 11)).should == false
    IsRoshChodesh(Time.new(2021, 5, 12)).should == true
    IsRoshHodesh(Time.new(2021, 5, 13)).should == false
    IsRoshChodesh(Time.new(2021, 6, 9)).should == false
    IsRoshHodesh(Time.new(2021, 6, 10)).should == true
    IsRoshChodesh(Time.new(2021, 6, 11)).should == true
    IsRoshHodesh(Time.new(2021, 6, 12)).should == false
    IsRoshChodesh(Time.new(2021, 7, 9)).should == false
    IsRoshHodesh(Time.new(2021, 7, 10)).should == true
    IsRoshChodesh(Time.new(2021, 7, 11)).should == false
    IsRoshHodesh(Time.new(2021, 8, 7)).should == false
    IsRoshChodesh(Time.new(2021, 8, 8)).should == true
    IsRoshHodesh(Time.new(2021, 8, 9)).should == true
    IsRoshChodesh(Time.new(2021, 8, 10)).should == false
    IsRoshHodesh(Time.new(2021, 9, 6)).should == false
    IsRoshChodesh(Time.new(2021, 9, 7)).should == false
    IsRoshHodesh(Time.new(2021, 9, 8)).should == false
    IsRoshChodesh(Time.new(2021, 10, 5)).should == false
    IsRoshHodesh(Time.new(2021, 10, 6)).should == true
    IsRoshChodesh(Time.new(2021, 10, 7)).should == true
    IsRoshHodesh(Time.new(2021, 10, 8)).should == false
    IsRoshChodesh(Time.new(2021, 11, 4)).should == false
    IsRoshHodesh(Time.new(2021, 11, 5)).should == true
    IsRoshChodesh(Time.new(2021, 11, 6)).should == false
    IsRoshHodesh(Time.new(2021, 12, 3)).should == false
    IsRoshChodesh(Time.new(2021, 12, 4)).should == true
    IsRoshHodesh(Time.new(2021, 12, 5)).should == true
    IsRoshChodesh(Time.new(2021, 12, 6)).should == false
    IsRoshHodesh(Time.new(2022, 1, 2)).should == false
    IsRoshChodesh(Time.new(2022, 1, 3)).should == true
    IsRoshHodesh(Time.new(2022, 1, 4)).should == false
    IsRoshChodesh(Time.new(2022, 1, 31)).should == false
    IsRoshHodesh(Time.new(2022, 2, 1)).should == true
    IsRoshChodesh(Time.new(2022, 2, 2)).should == true
    IsRoshHodesh(Time.new(2022, 2, 3)).should == false
    IsRoshChodesh(Time.new(2022, 3, 2)).should == false
    IsRoshHodesh(Time.new(2022, 3, 3)).should == true
    IsRoshChodesh(Time.new(2022, 3, 4)).should == true
    IsRoshHodesh(Time.new(2022, 3, 5)).should == false
    IsRoshChodesh(Time.new(2022, 4, 1)).should == false
    IsRoshHodesh(Time.new(2022, 4, 2)).should == true
    IsRoshChodesh(Time.new(2022, 4, 3)).should == false
  end

  it "should know when Rosh Chodesh is in a 385 day year" do
    IsRoshHodesh(Time.new(2026, 4, 16)).should == false
    IsRoshChodesh(Time.new(2026, 4, 17)).should == true
    IsRoshHodesh(Time.new(2026, 4, 18)).should == true
    IsRoshChodesh(Time.new(2026, 4, 19)).should == false
    IsRoshHodesh(Time.new(2026, 5, 16)).should == false
    IsRoshChodesh(Time.new(2026, 5, 17)).should == true
    IsRoshHodesh(Time.new(2026, 5, 18)).should == false
    IsRoshChodesh(Time.new(2026, 6, 14)).should == false
    IsRoshHodesh(Time.new(2026, 6, 15)).should == true
    IsRoshChodesh(Time.new(2026, 6, 16)).should == true
    IsRoshHodesh(Time.new(2026, 6, 17)).should == false
    IsRoshChodesh(Time.new(2026, 7, 14)).should == false
    IsRoshHodesh(Time.new(2026, 7, 15)).should == true
    IsRoshChodesh(Time.new(2026, 7, 16)).should == false
    IsRoshHodesh(Time.new(2026, 8, 12)).should == false
    IsRoshChodesh(Time.new(2026, 8, 13)).should == true
    IsRoshHodesh(Time.new(2026, 8, 14)).should == true
    IsRoshChodesh(Time.new(2026, 8, 15)).should == false
    IsRoshHodesh(Time.new(2026, 9, 11)).should == false
    IsRoshChodesh(Time.new(2026, 9, 12)).should == false
    IsRoshHodesh(Time.new(2026, 9, 13)).should == false
    IsRoshChodesh(Time.new(2026, 10, 10)).should == false
    IsRoshHodesh(Time.new(2026, 10, 11)).should == true
    IsRoshChodesh(Time.new(2026, 10, 12)).should == true
    IsRoshHodesh(Time.new(2026, 10, 13)).should == false
    IsRoshChodesh(Time.new(2026, 11, 9)).should == false
    IsRoshHodesh(Time.new(2026, 11, 10)).should == true
    IsRoshChodesh(Time.new(2026, 11, 11)).should == true
    IsRoshHodesh(Time.new(2026, 11, 12)).should == false
    IsRoshChodesh(Time.new(2026, 12, 9)).should == false
    IsRoshHodesh(Time.new(2026, 12, 10)).should == true
    IsRoshChodesh(Time.new(2026, 12, 11)).should == true
    IsRoshHodesh(Time.new(2026, 12, 12)).should == false
    IsRoshChodesh(Time.new(2027, 1, 8)).should == false
    IsRoshHodesh(Time.new(2027, 1, 9)).should == true
    IsRoshChodesh(Time.new(2027, 1, 10)).should == false
    IsRoshHodesh(Time.new(2027, 2, 6)).should == false
    IsRoshChodesh(Time.new(2027, 2, 7)).should == true
    IsRoshHodesh(Time.new(2027, 2, 8)).should == true
    IsRoshChodesh(Time.new(2027, 2, 9)).should == false
    IsRoshHodesh(Time.new(2027, 3, 8)).should == false
    IsRoshChodesh(Time.new(2027, 3, 9)).should == true
    IsRoshHodesh(Time.new(2027, 3, 10)).should == true
    IsRoshChodesh(Time.new(2027, 3, 11)).should == false
    IsRoshHodesh(Time.new(2027, 4, 7)).should == false
    IsRoshChodesh(Time.new(2027, 4, 8)).should == true
    IsRoshHodesh(Time.new(2027, 4, 9)).should == false
  end
end
