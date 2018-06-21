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
      expect(json["successful"]).to eq(true)
      expect(json["pdv"]["address"]["type"]).to eq("Point")
      expect(json["pdv"]["coverageArea"]["type"]).to eq("MultiPolygon")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: pdv }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it "assigns pdv" do
      get :show, params: { id: pdv }
      expect(assigns(:pdv)).to eq(pdv)
    end
  end

  describe "GET #search" do
    before (:all) do
      Pdv.destroy_all
      pdv1_area =  { type: "MultiPolygon", coordinates: [[[[30, 20],[45, 40],[10, 40],[30, 20]]]] }
      pdv2_area =  { type: "MultiPolygon", coordinates: [[[[30, 10],[50, 30],[60, 30],[60, 20],[50, 10]]]] }
      pdv3_area =  { type: "MultiPolygon", coordinates: [[[[44, 29],[60, 50],[20, 50]]]] }
      pdv1_address = { type: "Point", coordinates: [30, 30] }
      pdv2_address = { type: "Point", coordinates: [50, 20] }
      pdv3_address = { type: "Point", coordinates: [50, 45] }
      @pdv1 = create(:pdv, coverageArea: pdv1_area, address: pdv1_address)
      @pdv2 = create(:pdv, coverageArea: pdv2_area, address: pdv2_address)
      @pdv3 = create(:pdv, coverageArea: pdv3_area, address: pdv3_address)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :search, params: { lng: 30, lat: 30 }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    context "outside pdv delivery area" do
      it "far point" do
        get :search, params: { lng: 10, lat: 10 }
        expect(assigns(:pdv)).to eq(nil)
      end

      it "between two areas" do
        get :search, params: { lng: 40, lat: 30 }
        expect(assigns(:pdv)).to eq(nil)
      end
    end

    context "inside pdv area" do
      it "pdv1" do
        get :search, params: { lng: 20, lat: 35 }
        expect(assigns(:pdv)).to eq(@pdv1)
      end
      it "pdv2" do
        get :search, params: { lng: 50, lat: 25 }
        expect(assigns(:pdv)).to eq(@pdv2)
      end
      it "pdv3" do
        get :search, params: { lng: 30, lat: 43 }
        expect(assigns(:pdv)).to eq(@pdv3)
      end
    end

    context "inside two areas" do
      it "closest to pdv1" do
        get :search, params: { lng: 37, lat: 36 }
        expect(assigns(:pdv)).to eq(@pdv1)
      end
      it "closest to pdv3" do
        get :search, params: { lng: 43, lat: 39 }
        expect(assigns(:pdv)).to eq(@pdv3)
      end
    end
  end
end
