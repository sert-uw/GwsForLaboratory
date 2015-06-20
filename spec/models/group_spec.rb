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

  describe "include users" do
    let(:group) { create :group }
    let(:user) { create :user }
    subject { group.users.count }

    describe "no user" do
      it { expect(subject).to eq 0 }
    end

    describe "has one user" do
      it "create by group.users.create" do
        group.users.create(name: 'user1', email: 'test1@test.test', password: 'password1')
        expect(subject).to eq 1
      end

      it "add user to group.users" do
        group.users << user
        expect(subject).to eq 1
      end
    end

    describe "has many users" do
      before do
        group.users.create(name: 'user1', email: 'test1@test.test', password: 'password1')
        group.users << user
      end

      it { expect(subject).to eq 2 }
    end
  end
end
