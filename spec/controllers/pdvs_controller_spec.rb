require 'rails_helper'

RSpec.describe PdvsController, type: :controller do
  let (:pdv) { create(:pdv) }
  let (:pdv_attributes) { build(:pdv).as_json }

  context "#create" do
    it "a pdv" do
      expect {
        post :create, params: { pdv: pdv_attributes }, xhr: true
      }.to change(Pdv, :count).by(1)
      json = JSON.parse(response.body)
      expect(json["success"]).to eq(true)
      expect(json["pdv"]["address"]["type"]).to eq("Point")
      expect(json["pdv"]["coverageArea"]["type"]).to eq("MultiPolygon")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: pdv }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns pdv" do
      get :show, params: { id: pdv }
      expect(assigns(:pdv)).to eq(pdv)
    end
  end
end
