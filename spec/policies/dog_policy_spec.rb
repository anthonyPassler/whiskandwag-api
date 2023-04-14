# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogPolicy, type: :policy do
  subject { described_class.new(user, dog) }

  let(:dog) { create(:dog, user:) }

  context "when user is anonymous" do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
  end

  context "with a logged in user who is the owner" do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:show) }
  end

  context "with a logged in user who is not the owner" do
    let(:user) { create(:user) }
    let(:dog_user) { create(:user) }
    let(:dog) { create(:dog, user: dog_user) }

    it { is_expected.to forbid_action(:show) }
  end
end
