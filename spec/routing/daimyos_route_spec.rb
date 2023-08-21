# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Daimyos' do
  it 'routes /daimyos to the daimyos controller' do
    expect(get('/daimyos')).to route_to({"format"=>:json, "controller"=>"daimyos", "action"=>"index"})
  end
end
