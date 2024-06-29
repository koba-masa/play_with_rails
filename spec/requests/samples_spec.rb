# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Samples' do
  describe 'GET /samples' do
    it '200 OKが返ること' do
      get samples_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /sample/:id' do
    it '200 OKが返ること' do
      get sample_url(id: 1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /sample/:id' do
    it '200 OKが返ること' do
      post sample_url(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
