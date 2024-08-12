# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StorageFileUploader, type: :model do
  after do
    FileUtils.rm_rf('public/test')
    FileUtils.rm_rf('tmp/test')
  end

  describe 'アップロード' do
    let(:file) do
      # file_fixture('uploaders/storage_file/test.csv')
      File.open('spec/fixtures/files/uploaders/storage_file/test.csv')
    end

    it 'filenameを指定しない場合、元のファイル名でアップロードする' do
      uploader = described_class.new
      uploader.store!(file)

      expect(File).to exist('public/test/uploads/storage_file/test.csv')
    end

    it 'filenameを指定した場合、指定したファイル名でアップロードする' do
      uploader = described_class.new
      # uploader.filename = 'test.csv' → NG
      def uploader.filename
        'sample.csv'
      end
      uploader.store!(file)

      expect(File).to exist('public/test/uploads/storage_file/sample.csv')
    end
  end

  describe 'ダウンロード' do
    before do
      described_class.new.store!(
        File.open('spec/fixtures/files/uploaders/storage_file/test.csv'),
      )
    end

    it 'ファイルをダウンロードする' do
      uploader = described_class.new
      uploader.retrieve_from_store!('test.csv')

      expect(uploader.file.file).to eq(Rails.public_path.join('test/uploads/storage_file/test.csv').to_s)
      # > uploader.file.read.encoding
      # => #<Encoding:ASCII-8BIT>
      # アップロードしたファイルがBinaryとして扱われているため、Binaryとして書き出して、比較する
      downloaded_file_path = 'tmp/test/uploaders/storage_file/test.csv'
      FileUtils.mkdir_p('tmp/test/uploaders/storage_file')
      File.binwrite(downloaded_file_path, uploader.file.read)
      expect(File.read(downloaded_file_path)).to eq(file_fixture('uploaders/storage_file/test.csv').read)
    end
  end
end
