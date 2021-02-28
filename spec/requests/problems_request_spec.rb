require 'rails_helper'

RSpec.describe "Problems", type: :request do
  describe "#index"do
    it "show all problems" do
      get "/api/v1/problems"
      expect(response).to have_http_status 200
    end
  end
  describe "#create" do
    it "create new problem" do
      post "/api/v1/problems",
        params: {problem: {body:"問題更新。",categories:[1,2,3],question_at:Date.current,period_id:1,format_id:1},format: :json}
      expect(response).to have_http_status 200
      expect(JSON.parse(response.body)).to include("create"=>"no")
    end
  end
  describe "#update" do
    # it "update problem" do
    #   patch :update,
    #     params: {problem: {body:"問題更新。",categories:[1,2,3],question_at:Date.current,period_id:1,format_id:1}}
    #   expect(response).to have_http_status 200
    # end
  end
end
