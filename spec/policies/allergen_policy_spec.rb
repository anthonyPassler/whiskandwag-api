# frozen_string_literal: true

require "rails_helper"

RSpec.describe AllergenPolicy, type: :policy do
  subject { described_class.new(current_user, allergen) }

  let(:allergen) { create(:allergen) }
  let(:resolved_scope) { described_class::Scope.new(current_user, Allergen.all).resolve }

  context "without a logged in user" do
    let(:current_user) { nil }

    it { is_expected.to permit_actions %i[show] }

    it "does include allergen in resolved scope" do
      expect(resolved_scope).to include(allergen)
    end
  end
end
