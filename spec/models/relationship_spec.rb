require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  #関連付けされたデータであれば有効であること
  it "is valid associated data" do
    expect(FactoryBot.build(:relationship)).to be_valid
  end
  
end
