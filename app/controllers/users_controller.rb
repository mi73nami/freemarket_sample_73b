class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
    @contents = [
    {name:"マイページ",path: "#",verb: "GET"},{name: "お知らせ", path:"#", pattern: "GET"},
    {name: "やることリスト", path:"#", pattern: "GET"},
    {name: "いいね！一覧", path:"#", pattern: "GET"},
    {name: "出品する", path:"#", pattern: "GET"},
    {name: "下書き一覧", path:"#", pattern: "GET"},
    {name: "出品した商品-出品中", path:"#", pattern: "GET"},
    {name: "出品した商品-取引中", path:"#", pattern: "GET"},
    {name: "出品した商品-売却済み", path:"#", pattern: "GET"},
    {name: "購入した商品-取引中", path:"#", pattern: "GET"},
    {name: "購入した商品-過去の取引", path:"#", pattern: "GET"},
    {name: "ニュース一覧", path:"#", pattern: "GET"},
    {name: "評価一覧", path:"#", pattern: "GET"},
    {name: "ガイド", path:"#", pattern: "GET"},
    {name: "お問い合わせ", path:"#", pattern: "GET"}]
    @settings = [
    {name:"プロフィール",path: "#",verb: "GET"},
    {name:"発送元・お届け先住所変更",path: "#",verb: "GET"},
    {name:"支払い方法",path: "#",verb: "GET"},
    {name:"メール/パスワード",path: "#",verb: "GET"},
    {name:"本人情報",path: "#",verb: "GET"},
    {name:"電話番号の確認",path: "#",verb: "GET"},
    {name:"ログアウト",path: "#",verb: "GET"}]
    @furimapays = [
    {name:"売上・振込申請",path: "#",verb: "GET"},
    {name:"ポイント",path: "#",verb: "GET"}]
    

  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:image, :text).merge(user_id: current_user.id)
  end

end
