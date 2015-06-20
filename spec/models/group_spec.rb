require 'spec_helper'

RSpec.describe Group, type: :model do
  describe "validation" do
    it { expect(build :group).to be_valid }
    it { expect(build(:group, category: nil)).to be_valid }
    it { expect(build(:group, name: nil)).not_to be_valid }
  end

  describe "inner group test" do
    let(:parent) { create :group }
    it { expect(parent.children.create(name: 'Children')).not_to eq nil }
  end
end
