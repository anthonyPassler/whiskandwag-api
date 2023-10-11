# frozen_string_literal: true

require "rails_helper"

RSpec.describe MedicalConditionPolicy, type: :policy do
  subject { described_class.new(current_user, medical_condition) }

  let(:medical_condition) { create(:medical_condition) }
  let(:resolved_scope) { described_class::Scope.new(current_user, MedicalCondition.all).resolve }

  context "without a logged in user" do
    let(:current_user) { nil }

    it { is_expected.to forbid_actions %i[show] }

    it "does not include medical_condition in resolved scope" do
      expect(resolved_scope).not_to include(medical_condition)
    end
  end

  context "with a logged in user" do
    let(:current_user) { create(:user) }

    it { is_expected.to permit_actions %i[show] }

    it "does include medical_condition in resolved scope" do
      expect(resolved_scope).to include(medical_condition)
    end
  end
end
