# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NestedTransactions' do
  describe 'POST /' do
    subject(:post_nested_transaction) { post nested_transactions_url }

    it do
      post_nested_transaction
    rescue StandardError
      expect(Daimyo.count).to eq 0
    end
  end
end
