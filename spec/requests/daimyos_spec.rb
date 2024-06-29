# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Daimyos' do
  let(:nobunaga) { create(:daimyo) }
  let(:hideyoshi) { create(:daimyo, :hideyoshi) }

  describe 'GET /daimyos' do
    subject(:get_daimyos) { get daimyos_url }

    context 'レコードが存在する場合' do
      before do
        nobunaga
        hideyoshi
      end

      let(:expected_body) do
        {
          'daimyos' => [
            {
              'id' => nobunaga.id,
              'name' => nobunaga.name,
              'birthed_on' => nobunaga.birthed_on.strftime('%Y/%m/%d'),
              'died_on' => nobunaga.died_on.strftime('%Y/%m/%d'),
            },
            {
              'id' => hideyoshi.id,
              'name' => hideyoshi.name,
              'birthed_on' => hideyoshi.birthed_on.strftime('%Y/%m/%d'),
              'died_on' => hideyoshi.died_on.strftime('%Y/%m/%d'),
            },
          ],
        }
      end

      it '200 OKが返ること' do
        get_daimyos
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq(expected_body)
      end
    end

    context 'レコードが存在しない場合' do
      let(:expected_body) do
        {
          'daimyos' => [],
        }
      end

      it '200 OKが返ること' do
        get_daimyos
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq(expected_body)
      end
    end
  end

  describe 'GET /daimyos/:id' do
    context 'レコードが存在する場合' do
      subject(:get_daimyo) { get daimyo_url(daimyo_id) }

      let(:daimyo_id) { nobunaga.id }
      let(:expected_body) do
        {
          'daimyo' => {
            'id' => nobunaga.id,
            'name' => nobunaga.name,
            'birthed_on' => nobunaga.birthed_on.strftime('%Y/%m/%d'),
            'died_on' => nobunaga.died_on.strftime('%Y/%m/%d'),
          },
        }
      end

      it '200 OKが返ること' do
        get_daimyo

        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq(expected_body)
      end
    end
  end
end
