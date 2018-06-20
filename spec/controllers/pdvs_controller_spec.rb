require 'rails_helper'

RSpec.describe PdvsController, type: :controller do
  let (:pdv_params) { build(:pdv) }
  context "#create" do
    it "a pdv" do
      expect {
        post :create, params: { pdv: pdv_params.as_json }, xhr: true
      }.to change(Pdv, :count).by(1)
      json = JSON.parse(response.body)
      expect(json["success"]).to eq(true)
      expect(json["pdv"]["address"]["type"]).to eq("Point")
      expect(json["pdv"]["coverageArea"]["type"]).to eq("MultiPolygon")
    end
  end
end
