# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrderSerializer do
  subject(:order_serializer) { described_class.new(order, options) }

  let(:user) { create(:user) }
  let(:order) { create(:order, user:) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(order_serializer).to match_snapshot("order_serializer")
    end

    context "with includes" do
      let(:options) { { include: %i[user] } }

      it "serializes correctly" do
        expect(order_serializer).to match_snapshot("order_serializer_with_includes")
      end
    end
  end
end
