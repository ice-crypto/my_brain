class Problem < ApplicationRecord
  validates :body,
    presence: true
  validates :categories,
    presence: true

  belongs_to :format
  belongs_to :period
  has_and_belongs_to_many :books

  # function
  def self.of_questioin_select
    Problem.where(question_at: (Date.current.beginning_of_month)..(Date.current))
  end

  def calc_question_at(correct_wrong, answer_speed)
    if answer_speed < 600
      if correct_wrong
        self.question_at += self.period.next.days
        self.period_id = self.period.next_period_id
      else
        self.question_at += self.period.prev.days
        self.period_id = self.period.prev_period_id
      end
    else
      self.question_at += self.period.period.days
      self.period_id = self.period.prev_period_id
    end
    self.save
  end
end
