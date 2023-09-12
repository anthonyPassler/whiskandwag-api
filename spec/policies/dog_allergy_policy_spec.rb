# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogAllergyPolicy, type: :policy do
  subject { described_class.new(current_user, dog_allergy) }

  let(:dog_allergy) { create(:dog_allergy) }
  let(:current_user) { nil }

  context "when current_user can view a dog" do
    it { is_expected.to permit_actions %i[create destroy] }
  end
end
