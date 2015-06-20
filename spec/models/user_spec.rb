require 'spec_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it { expect(build :user).to be_valid }
    it { expect(build(:user, name: nil)).not_to be_valid }
    it { expect(build(:user, email: nil)).not_to be_valid }
    it { expect(build(:user, password: nil)).not_to be_valid }
  end

  describe "include groups" do
    let(:group) { create :group }
    let(:user) { create :user }
    subject { user.groups.count }

    describe "no group" do
      it { expect(subject).to eq 0 }
    end

    describe "has one group" do
      it "create by user.groups.create" do
        user.groups.create(name: 'Group1', category: 'cat1')
        expect(subject).to eq 1
      end

      it "add group to user.groups" do
        user.groups << group
        expect(subject).to eq 1
      end
    end

    describe "has many groups" do
      before do
        user.groups.create(name: 'Group1', category: 'cat1')
        user.groups << group
      end

      it { expect(subject).to eq 2 }
    end
  end
end
