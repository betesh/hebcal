require 'hebcal/passover' 

describe "passover test" do
  include HebCal::Passover
  # Test each year in 19-year-cycle to verify that leap years are handled correctly
  it "should get correct date in year 1 of cycle" do
    WhenIsPesach(1998).should == Time.new(1998, 4, 11)
  end
  it "should get correct date in year 2 of cycle" do
    WhenIsPesach(1999).should == Time.new(1999, 4, 1)
  end
  it "should get correct date in year 3 of cycle" do
    WhenIsPesach(2000).should == Time.new(2000, 4, 20)
  end
  it "should get correct date in year 4 of cycle" do
    WhenIsPesach(2001).should == Time.new(2001, 4, 8)
  end
  it "should get correct date in year 5 of cycle" do
    WhenIsPesach(2002).should == Time.new(2002, 3, 28)
  end
  it "should get correct date in year 6 of cycle" do
    WhenIsPesach(2003).should == Time.new(2003, 4, 17)
  end
  it "should get correct date in year 7 of cycle" do
    WhenIsPesach(2004).should == Time.new(2004, 4, 6)
  end
  it "should get correct date in year 8 of cycle" do
    WhenIsPesach(2005).should == Time.new(2005, 4, 24)
  end
  it "should get correct date in year 9 of cycle" do
    WhenIsPesach(2006).should == Time.new(2006, 4, 13)
  end
  it "should get correct date in year 10 of cycle" do
    WhenIsPesach(2007).should == Time.new(2007, 4, 3)
  end
  it "should get correct date in year 11 of cycle" do
    WhenIsPesach(2008).should == Time.new(2008, 4, 20)
  end
  it "should get correct date in year 12 of cycle" do
    WhenIsPesach(2009).should == Time.new(2009, 4, 9)
  end
  it "should get correct date in year 13 of cycle" do
    WhenIsPesach(2010).should == Time.new(2010, 3, 30)
  end
  it "should get correct date in year 14 of cycle" do
    WhenIsPesach(2011).should == Time.new(2011, 4, 19)
  end
  it "should get correct date in year 15 of cycle" do
    WhenIsPesach(2012).should == Time.new(2012, 4, 7)
  end
  it "should get correct date in year 16 of cycle" do
    WhenIsPesach(2013).should == Time.new(2013, 3, 26)
  end
  it "should get correct date in year 17 of cycle" do
    WhenIsPesach(2014).should == Time.new(2014, 4, 15)
  end
  it "should get correct date in year 18 of cycle" do
    WhenIsPesach(2015).should == Time.new(2015, 4, 4)
  end
  it "should get correct date in year 19 of cycle" do
    WhenIsPesach(2016).should == Time.new(2016, 4, 23)
  end

  # Test each year type to verify that date is calculated based on molad
  it "should get correct date in year type 1" do
    WhenIsPesach(2019).should == Time.new(2019, 4, 20)
  end
  it "should get correct date in year type 2" do
    WhenIsPesach(2013).should == Time.new(2013, 3, 26)
  end
  it "should get correct date in year type 3" do
    WhenIsPesach(2001).should == Time.new(2001, 4, 8)
  end
  it "should get correct date in year type 4" do
    WhenIsPesach(2024).should == Time.new(2024, 4, 23)
  end
  it "should get correct date in year type 5" do
    WhenIsPesach(2012).should == Time.new(2012, 4, 7)
  end
  it "should get correct date in year type 6" do
    WhenIsPesach(2003).should == Time.new(2003, 4, 17)
  end
  it "should get correct date in year type 7" do
    WhenIsPesach(2000).should == Time.new(2000, 4, 20)
  end
  it "should get correct date in year type 8" do
    WhenIsPesach(2015).should == Time.new(2015, 4, 4)
  end
  it "should get correct date in year type 9" do
    WhenIsPesach(2029).should == Time.new(2029, 3, 31)
  end
  it "should get correct date in year type 10" do
    WhenIsPesach(2021).should == Time.new(2021, 3, 28)
  end
  it "should get correct date in year type 11" do
    WhenIsPesach(2010).should == Time.new(2010, 3, 30)
  end
  it "should get correct date in year type 12" do
    WhenIsPesach(2004).should == Time.new(2004, 4, 6)
  end
  it "should get correct date in year type 13" do
    WhenIsPesach(2002).should == Time.new(2002, 3, 28)
  end
  it "should get correct date in year type 14" do
    WhenIsPesach(2023).should == Time.new(2023, 4, 6)
  end

  # Test that Gregorian divergence from Julian calendar is handled correctly
  it "should have a gregorian divergence of 12 in 1899" do
    WhenIsPesach(1899).should == Time.new(1899, 3, 26)
  end
  it "should have a gregorian divergence of 13 in 1900" do
    WhenIsPesach(1900).should == Time.new(1900, 4, 14)
  end
  it "should have a gregorian divergence of 13 in 2099" do
    WhenIsPesach(2099).should == Time.new(2099, 4, 5)
  end
  it "should have a gregorian divergence of 14 in 2100" do
    WhenIsPesach(2100).should == Time.new(2100, 4, 24)
  end

  # Test boundary cases of DMZ
  it "should miss DMZ by 45 halakim in 516" do
    WhenIsPesach(516).wday.should == 6
  end
  it "should make DMZ with 79 halakim to space in 4048" do
    WhenIsPesach(4048).wday.should == 0
  end

  # Test boundary cases of DMZ + ADU
  it "should miss DMZ+ADU by 13 halakim in 146" do
    WhenIsPesach(146).wday.should == 2
  end
  it "should make DMZ+ADU with 88 halakim to space in 3682" do
    WhenIsPesach(3682).wday.should == 2
  end

  # Test boundary cases of gatarad
  it "should miss Gatarad by 68 halakim in 519" do
    WhenIsPesach(519).wday.should == 0
  end
  it "should make Gatarad with 95 halakim to space in 3862" do
    WhenIsPesach(3862).wday.should == 2
  end

  # Test boundary cases of betutakpat
  it "should miss Betutakpt by 143 halakim in 2174" do
    WhenIsPesach(2174).wday.should == 6
  end
  it "should make Betutakpt with 89 halakim to space in 3683" do
    WhenIsPesach(3683).wday.should == 0
  end
end
