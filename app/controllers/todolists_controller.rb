class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
  end
  def edit
    @list = List.find(params[:id])
  end
  def update

    # ---- ここからコードを書きましょう ---- #
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to todolist_path(@list.id)
    else
      render :edit
    end  
    # ---- ここまでのあいだにコードを書きましょう ---- #

  end
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
  end
  def destroy

    # ---- ここからコードを書きましょう ---- #
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
    # ---- ここまでのあいだにコードを書きましょう ---- #

  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
