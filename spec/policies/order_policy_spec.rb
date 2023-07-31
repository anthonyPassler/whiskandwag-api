# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrderPolicy, type: :policy do
  subject { described_class.new(current_user, order) }

  let(:order) { create(:order, user: order_user) }
  let(:current_user) { create(:user) }
  let(:order_user) { current_user }
  let(:resolved_scope) { described_class::Scope.new(current_user, Order.all).resolve }

  context "without a logged in user" do
    let(:current_user) { nil }

    it { is_expected.to forbid_actions %i[show create update destroy] }

    it "does not include order in resolved scope" do
      expect(resolved_scope).not_to include(order)
    end
  end

  context "with a logged in user that does not own the order" do
    let(:order_user) { create(:user) }

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_actions %i[show update destroy] }

    it "does not include order in resolved scope" do
      expect(resolved_scope).not_to include(order)
    end
  end

  context "with a logged in user that owns the order" do
    it { is_expected.to permit_actions %i[show update destroy] }

    it "includes order in resolved scope" do
      expect(resolved_scope).to include(order)
    end
  end
end
