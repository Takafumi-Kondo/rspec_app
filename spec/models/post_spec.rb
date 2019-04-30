require 'rails_helper'

RSpec.describe Post, type: :model do

	context "データが正しく保存される" do
		before do
			@post = Post.new
			@post.title = "Hello WebCamp"
			@post.content = "今日も晴れです。"
			@post.save
		end
		it "全て入力してあるので保存される" do
			expect(@post).to be_valid
		end
	end

	context "データが正しく保存されない" do
		before do
			@post = Post.new
			@post.title = ""
			@post.content = "今日も晴れです"
			@post.save
		end
		it "titleが入力されていないので保存されない" do
			expect(@post).to be_invalid#be /invalidで正しくデータ保存されてないのを確認
			expect(@post.errors[:title]).to include("can't be blank")
		end#include()でpresence: trueのバリデーションかけた場合のエラーメッセに含まれてるかどうか確認
	end

end
