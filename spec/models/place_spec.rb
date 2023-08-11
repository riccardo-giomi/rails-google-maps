# frozen_string_literal: true

RSpec.describe Place do
  context 'when validating' do
    let(:place) { described_class.new }

    it 'requires a name' do
      place.valid?

      expect(place.errors[:name]).to include(/blank/)
    end

    it 'requires a longitude' do
      place.valid?

      expect(place.errors[:longitude]).to include(/blank/)
    end

    it 'requires a latitude' do
      place.valid?

      expect(place.errors[:latitude]).to include(/blank/)
    end
  end
end
