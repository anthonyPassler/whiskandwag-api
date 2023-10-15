# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogMedicalConditionPolicy, type: :policy do
  subject { described_class.new(current_user, dog_allergy) }

  let(:dog_allergy) { create(:dog_allergy, dog:) }
  let(:current_user) { dog_allergy.dog.user }

  context "when the dog user and current user are still anonymous" do
    let(:dog) { create(:dog, user: nil) }

    it { is_expected.to permit_actions %i[create destroy] }
  end

  context "when the dog user exists and is the current user" do
    let(:dog) { create(:dog, :with_user) }

    it { is_expected.to permit_actions %i[create destroy] }
  end

  context "when the dog user exists and is not the current user" do
    let!(:current_user) { create(:user) }
    let(:dog) { create(:dog, :with_user) }

    it { is_expected.to forbid_actions %i[create destroy] }
  end
end
