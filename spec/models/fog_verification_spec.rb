# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FogVerification do
  describe 'upload!' do
    let(:file) { file_fixture('models/fog_verification/test.csv').read }

    after do
      described_class.new.download('test.csv').destroy
    end

    it 'ファイルがアップロードできること' do
      instance = described_class.new

      expect do
        instance.upload!('test.csv', file)
      end.not_to raise_error
    end
  end

  describe 'download' do
    let(:file) { file_fixture('models/fog_verification/test.csv').read }

    before do
      described_class.new.upload!('test.csv', file)
    end

    after do
      FileUtils.rm_rf('tmp/test')
      described_class.new.download('test.csv').destroy
    end

    it 'ファイルをダウンロードする' do
      instance = described_class.new

      # https://github.com/fog/fog-aws/blob/a8518f050980607ee448654f6792b662300c8136/lib/fog/aws/requests/storage/put_object.rb#L34
      downloaded_file_path = 'tmp/test/models/fog_verification/test.csv'
      FileUtils.mkdir_p('tmp/test/models/fog_verification')
      File.binwrite(downloaded_file_path, instance.download('test.csv').body)
      expect(File.read(downloaded_file_path)).to eq(file)
    end
  end

  describe 'list' do
    let(:file) { file_fixture('models/fog_verification/test.csv').read }

    before do
      described_class.new.upload!('test1.csv', file)
      described_class.new.upload!('test2.csv', file)
    end

    after do
      described_class.new.download('test1.csv').destroy
      described_class.new.download('test2.csv').destroy
    end

    it 'ファイル一覧を取得する' do
      instance = described_class.new

      result = instance.list
      expect(result.map(&:key)).to match_array(
        %w[
          test/fog_verification/test1.csv
          test/fog_verification/test2.csv
        ],
      )
    end
  end
end
