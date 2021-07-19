require "test_helper"

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid if score is between 0 and 10" do
    0.upto(10).each do |i|
      rating = Rating.new(score: i)
      rating.valid?
      assert_empty rating.errors[:score]
    end
  end

  test "invalid if less than 0" do
    rating = Rating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "invalid if greater than 10"do
    rating = Rating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

# promoter tests
  test "promoter? returns true if score is 9 and 10" do
    9.upto(10) do |i|
      rating = Rating.new(score: i)
      assert rating.promoter?
    end
  end

  test "promoter? returns false if score is less than 9" do
    rating = Rating.new(score: 1)
    assert_not rating.promoter?
  end

  test "promoter? returns false if socre is greater than 10" do
    rating = Rating.new(score: 11)
    assert_not rating.promoter?
  end

# passive tests
  test "passive? returns true if score is 7 or 8" do
    7.upto(8) do |i|
      rating = Rating.new(score: i)
      assert rating.passive?
    end
  end

  test "passive? returns false if score is less than 7" do
    0.upto(6) do |i|
      rating = Rating.new(score: i)
      assert_not rating.passive?
    end
  end

  test "passive? returns false if score is greater than 8" do
    9.upto(10) do |i|
      rating = Rating.new(score: i)
      assert_not rating.passive?
    end
  end

  # dectractor tests
  test "detractor? returns true if score is less than or equal to 6" do
    0.upto(6) do |i|
      rating = Rating.new(score: i)
      assert rating.detractor?
    end
  end

  test "detractor? returns false if score is less than 0" do
      rating = Rating.new(score: -1)
      assert_not rating.detractor?
  end

  test "detractor? returns false if score is greater than 6" do
    7.upto(10) do |i|
      rating = Rating.new(score: i)
      assert_not rating.detractor?
    end
  end

  # update person score test
  test "update person score cache when created" do
    person = people(:one)
    person.ratings.create(score: 9)
    assert_equal 9, person.score
  end
end
