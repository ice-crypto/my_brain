class Period < ApplicationRecord

  has_many :problems

  #function
  def next
    self.id >= Period.maximum(:id) ? self.period : Period.find_by(id: self.id+1).period
  end

  def next_period_id
    self.id >= Period.maximum(:id) ? self.id : self.id+1
  end

  def prev
    self.id <= 1 ? self.period : Period.find_by(id: self.id-1).period
  end

  def prev_period_id
    self.id <= 1 ? self.id : self.id-1
  end
end
