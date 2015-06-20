require 'spec_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it { expect(build :user).to be_valid }
    it { expect(build(:user, name: nil)).not_to be_valid }
    it { expect(build(:user, email: nil)).not_to be_valid }
    it { expect(build(:user, password: nil)).not_to be_valid }
  end
end
