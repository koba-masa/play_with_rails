# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Samples' do
  it 'routes /sampls to the samples controller' do
    expect(get('/samples')).to route_to({ 'format' => :json, 'controller' => 'samples', 'action' => 'index' })
  end

  it 'routes /sampls/:id to the samples controller' do
    expect(get('/samples/1')).to route_to({ 'format' => :json, 'controller' => 'samples', 'action' => 'new', 'id' => '1' })
  end

  it 'routes /sampls/:id to the samples controller' do
    expect(post('/samples/1')).to route_to({ 'format' => :json, 'controller' => 'samples', 'action' => 'create', 'id' => '1'})
  end
end
