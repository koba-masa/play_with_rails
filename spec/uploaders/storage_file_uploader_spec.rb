require 'rails_helper'

RSpec.describe StorageFileUploader, type: :model do
  after do
    FileUtils.rm_rf('public/test')
  end

  describe 'アップロード' do
    let(:file) do
      #file_fixture('uploaders/storage_file/test.csv')
      File.open('spec/fixtures/files/uploaders/storage_file/test.csv')
    end

    it 'filenameを指定しない場合、元のファイル名でアップロードする' do
      uploader = described_class.new
      uploader.store!(file)

      expect(File.exist?('public/test/uploads/storage_file/test.csv')).to be_truthy
    end

    it 'filenameを指定した場合、指定したファイル名でアップロードする' do
      uploader = described_class.new
      #uploader.filename = 'test.csv' → NG
      def uploader.filename
        'sample.csv'
      end
      uploader.store!(file)

      expect(File.exist?('public/test/uploads/storage_file/sample.csv')).to be_truthy
    end
  end
end
