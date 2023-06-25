# frozen_string_literal: true

require "rails_helper"

RSpec.describe Record::Get, type: :service do
  subject(:service) { described_class.call(model:, current_user:, id:) }

  let(:model) { Dog }
  let(:current_user) { create(:user) }
  let(:id) { dog.id }

  context "when the dog exists" do
    let(:dog) { create(:dog) }

    it "returns the dog" do
      expect(service.result).to eq(dog)
    end
  end

  context "when the dog does not exist" do
    let(:id) { 0 }

    it "raises an ActiveRecord::RecordNotFound error" do
      expect { service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
