class Rating < ApplicationRecord
  belongs_to :person
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def promoter?
  # [9,10].include?(score)
    score >= 9 && score <= 10
  end

  def passive?
    score >= 7 && score <= 8
  end

  def detractor?
    score >= 0 && score <= 6
  end

  after_create do
    UpdatePersonJob.perform_later(person_id, score)
  end
end
