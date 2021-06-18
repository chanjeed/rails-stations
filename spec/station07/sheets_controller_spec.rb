require 'rails_helper'

RSpec.describe SheetsController, type: :controller do
  render_views
  describe 'Station7 GET /sheets' do
    let!(:sheets) { create_list(:sheet, 5) } 
    before do
      get 'index'
    end

    it '200を返すこと' do
      expect(response).to have_http_status(200)
    end

    it 'HTMLの中にはtableタグがあること' do
      expect(response.body).to include('</table>')
    end

    it '実装の中でsheetsテーブルにアクセスしていること' do
      expect(response.body).to include("#{sheet.first.column}").and include("#{sheet.last.column}")
    end
  end
end
