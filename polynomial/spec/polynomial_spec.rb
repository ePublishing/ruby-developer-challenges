require 'rspec'
require 'polynomial'

describe Polynomial do
  before do
    @p1 = Polynomial.new([-5,-2,1,0,8])
    @p2 = Polynomial.new([1,0,7])
    @p3 = Polynomial.new([-1,-2,3,0])
    @p4 = Polynomial.new([0,0,0])
  end

  specify "first negative" do
    @p1.to_s.should eq("-5x^4-2x^3+x^2+8")
  end

  specify "simple" do
    @p2.to_s.should eq("x^2+7")
  end

  specify "first minus one" do
    @p3.to_s.should eq("-x^3-2x^2+3x")
  end

  specify "all zero" do
    @p4.to_s.should eq("0")
  end

  specify "error" do
    expect { Polynomial.new([1]) }.to raise_error(ArgumentError, /Two or more coefficients are required/)
  end
end
