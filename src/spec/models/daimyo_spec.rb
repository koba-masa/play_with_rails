# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Daimyo do
  let(:normal_record) { build(:daimyo) }
  let(:vaild_record) { described_class.new }

  describe 'バリデーション' do
    describe 'name' do
      it '必須項目であること' do
        expect(normal_record).to be_valid
        expect(vaild_record).to be_invalid
      end

      it '32文字以内であること' do
        instance = described_class.new

        instance.name = 'a' * 31
        expect(instance).to be_valid
        instance.name = 'a' * 32
        expect(instance).to be_valid
        instance.name = 'a' * 33
        expect(instance).to be_invalid
      end
    end
  end
end
