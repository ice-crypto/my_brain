require 'rails_helper'

RSpec.describe Period, type: :model do
  describe "period user definite function test" do
    before(:each) do
      @period = FactoryBot.create(:period)
      @period_3 = FactoryBot.create(:period,:period_3)
    end
    it "#next test. return 'period' next id." do
      expect(@period.next).to eq @period_3.period
    end
    it "#next_period_id is return next period_id." do
      expect(@period.next_period_id).to eq @period_3.id
    end
    it "#prev is return prev 'period.period'. " do
      expect(@period_3.prev).to eq @period.period
    end
    it "#prev_period_id is return prev period id. " do
      expect(@period_3.prev_period_id).to eq @period.id
    end
  end
end
