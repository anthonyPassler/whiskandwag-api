# frozen_string_literal: true

require "rails_helper"

RSpec.describe Record::Destroy, type: :service do
  subject(:service) { described_class.call(model:, current_user:, id:) }

  let(:model) { Dog }
  let(:current_user) { create(:user) }
  let(:id) { dog.id }

  context "when the dog exists" do
    context "when the user is the owner of the dog" do
      let!(:dog) { create(:dog, user: current_user) }

      it "returns the dog" do
        expect { service }.to change(Dog, :count).by(-1)
      end
    end

    context "when the user is not the owner of the dog" do
      let!(:dog) { create(:dog) }

      it "raises a Pundit::NotAuthorizedError" do
        expect { service }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

  context "when the dog does not exist" do
    let(:id) { 0 }

    it "raises an ActiveRecord::RecordNotFound error" do
      expect { service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
