# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places/index' do
  before do
    assign(:places, [
             Place.create!(
               name:      'Name',
               latitude:  '9.99',
               longitude: '9.99'
             ),
             Place.create!(
               name:      'Name',
               latitude:  '9.99',
               longitude: '9.99'
             )
           ])
  end

  it 'renders a list of places' do
    render
    assert_select '#places>div', text: Regexp.new('Name'.to_s), count: 2
    assert_select '#places>div', text: Regexp.new('9.99'.to_s), count: 2
    assert_select '#places>div', text: Regexp.new('9.99'.to_s), count: 2
  end
end
