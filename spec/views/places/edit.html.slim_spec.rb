# frozen_string_literal: true

RSpec.describe 'places/edit' do
  let(:place) do
    Place.create!(
      name:      'MyString',
      latitude:  '9.99',
      longitude: '9.99'
    )
  end

  before do
    assign(:place, place)
  end

  it 'renders the edit place form' do # rubocop:disable RSpec/ExampleLength
    render

    assert_select 'form[action=?][method=?]', place_path(place), 'post' do
      assert_select 'input[name=?]', 'place[name]'

      assert_select 'input[name=?]', 'place[latitude]'

      assert_select 'input[name=?]', 'place[longitude]'
    end
  end
end
