# frozen_string_literal: true

shared_examples "valid data" do |attribute, values = []|
  values.each do |value|
    context "with `#{attribute}: #{value.inspect}`" do
      let(:data) { required_attributes.merge(attribute => value) }

      it do
        expect { subject }.not_to raise_error
      end
    end
  end
end

shared_examples "invalid data" do |attribute, values = []|
  values.each do |value|
    context "with `#{attribute}: #{value.inspect}`" do
      let(:data) { required_attributes.merge(attribute => value) }

      it do
        expect { subject }.to raise_error(ApplicationSchema::ValidationSchemaError)
      end
    end
  end
end
