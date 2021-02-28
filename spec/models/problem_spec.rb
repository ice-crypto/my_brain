require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe "problem build successfull" do
    it "no book relation." do
      problem = FactoryBot.build(:problem)
      problem.valid?
      expect(problem).to be_valid
    end
    it "book relation." do
      problem = FactoryBot.build(:problem)
      problem.books.build(FactoryBot.create(:book).serializable_hash)
      problem.valid?
      expect(problem).to be_valid
    end
  end
  describe "problem create successfull" do

  end
  describe "problem build faild" do

  end
  describe "problem function" do
    before(:each) do
      @prblem_two_days_ago = FactoryBot.create(:problem, question_at: Date.current-2.days)
      @problem_current     = FactoryBot.create(:problem)#本日出題
      @problem_two_days    = FactoryBot.create(:problem, question_at: Date.current+2.days)
      @problem_seven_days  = FactoryBot.create(:problem, question_at: Date.current+7.days)
    end
    context "出題問題抽出(#of_questioin_select)" do
      it "当日出題のみ返す" do
        Problem.of_questioin_select.each do |problem|
          expect(problem.question_at.today?).to eq true
        end
      end
    end
    it "#calc_question_at when input(true, 400)." do
      @problem = FactoryBot.create(:problem)
      FactoryBot.create(:period, :period_3)
      @problem.calc_question_at(true, 400)
      expect(@problem.period.period).to eq 3
    end
    it "#calc_question_at when input(false, 400)" do
      @problem = FactoryBot.create(:problem)
      FactoryBot.create(:period, :period_3)
      @problem.calc_question_at(false, 400)
      expect(@problem.period.period).to eq 1
    end
    it "#calc_question_at when input(false, 700)" do
      @problem = FactoryBot.create(:problem)
      FactoryBot.create(:period, :period_3)
      @problem.calc_question_at(false, 700)
      expect(@problem.period.period).to eq 1
    end
  end
end
