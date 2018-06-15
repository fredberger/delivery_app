require 'rails_helper'

RSpec.describe Pdv, type: :model do
  before :each do
    @pdv = Pdv.new
    @pdv.valid?
  end

  it 'has a tradingName' do
    expect(@pdv.errors[:tradingName]).to include("can't be blank")
  end

  it 'has a ownerName' do
    expect(@pdv.errors[:ownerName]).to include("can't be blank")
  end

  it 'has a document' do
    expect(@pdv.errors[:document]).to include("can't be blank")
  end

  it 'has a coverageArea' do
    expect(@pdv.errors[:coverageArea]).to include("can't be blank")
  end

  it 'has a address' do
    expect(@pdv.errors[:address]).to include("can't be blank")
  end
end
