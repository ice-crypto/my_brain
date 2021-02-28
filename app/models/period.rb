class Period < ApplicationRecord
  validates :period,
    presence: true

  has_many :problems

  #function
  def next
    Period.find_by(id: self.id+1) == nil ? self.period : Period.find_by(id: self.id+1).period
  end

  def next_period_id
    Period.find_by(id: self.id+1) == nil ? self.id : self.id+1
  end

  def prev
    self.id-1 < 0 ? self.period : Period.find_by(id: self.id-1).period
  end

  def prev_period_id
    self.id < 1 ? self.id : self.id-1
  end
end
