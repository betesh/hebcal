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





end
