# frozen_string_literal: true

RSpec.describe 'places/new' do
  before do
    assign(:place, Place.new(
                     name:      'MyString',
                     latitude:  '9.99',
                     longitude: '9.99'
                   ))
  end

  it 'renders new place form' do # rubocop:disable RSpec/ExampleLength
    render

    assert_select 'form[action=?][method=?]', places_path, 'post' do
      assert_select 'input[name=?]', 'place[name]'

      assert_select 'input[name=?]', 'place[latitude]'

      assert_select 'input[name=?]', 'place[longitude]'
    end
  end
end
