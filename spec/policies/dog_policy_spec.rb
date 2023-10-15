# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogPolicy, type: :policy do
  subject(:dog_policy) { described_class.new(current_user, dog) }

  let(:dog) { create(:dog, user: current_user) }
  let(:resolved_scope) { described_class::Scope.new(current_user, Dog.all).resolve }

  context "when current_user is anonymous" do
    let(:current_user) { nil }

    it { is_expected.to permit_action(:create) }

    context "when dog has no owner" do
      it do
        expect(dog_policy).to permit_actions %i[show update show_allergies_relationship show_recipes_relationship
                                                show_medical_conditions_relationship]
      end

      it { is_expected.to forbid_action(:destroy) }

      it "does not include dog in resolved scope" do
        expect(resolved_scope).not_to include(dog)
      end
    end

    context "when dog has an assigned owner" do
      let(:dog_user) { create(:user) }
      let(:dog) { create(:dog, user: dog_user) }

      it do
        expect(dog_policy).to forbid_actions %i[show update destroy show_allergies_relationship
                                                show_recipes_relationship show_medical_conditions_relationship]
      end
    end
  end

  context "when current_user is logged in" do
    let(:current_user) { create(:user) }

    it { is_expected.to permit_action(:create) }

    context "when current_user is the owner" do
      it do
        expect(dog_policy).to permit_actions %i[show update destroy show_allergies_relationship
                                                show_recipes_relationship show_medical_conditions_relationship]
      end

      it "includes dog in resolved scope" do
        expect(resolved_scope).to include(dog)
      end
    end

    context "when current_user is not the owner" do
      let(:dog_user) { create(:user) }
      let(:dog) { create(:dog, user: dog_user) }

      it do
        expect(dog_policy).to forbid_actions %i[show update destroy show_allergies_relationship
                                                show_recipes_relationship show_medical_conditions_relationship]
      end

      it "does not include dog in resolved scope" do
        expect(resolved_scope).not_to include(dog)
      end
    end
  end
end
