# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FogVerification do
  describe 'upload!' do
    let(:file) { file_fixture('models/fog_verification/test.csv').read }

    it 'ファイルがアップロードできること' do
      instance = described_class.new

      expect do
        instance.upload!('test.csv', file)
      end.not_to raise_error
    end
  end
end
