require 'rails_helper'

RSpec.describe PostsController, type: :controller do#テスト対象指定
	describe '新規投稿ページ' do#説明
      context "新規投稿ページが正しく表示される" do#正しく表示されるときのこと
        before do#get new をitの前に行う
          get :new
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200#レスポンスステータス受け取り
        end

        render_views#viewで表示されるデータ取得
        it 'タイトルが正しく表示されてること' do
        	expect(response.body).to include("新規投稿")#response.bodyで取得したhtmlデータがある
      	end#include()で中身あるか検証
      end
    end
end
