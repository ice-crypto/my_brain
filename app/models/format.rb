class Format < ApplicationRecord
  validates :problem_type,
    presence: true
  enum type: {
    sentence_problem: 0,
    blank_problem: 1,
    image_problem: 2,
    reordering_problem: 3
  }

  has_many :problems
end
