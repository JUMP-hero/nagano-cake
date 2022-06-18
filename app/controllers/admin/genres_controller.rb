class GenresController < ApplicationController
  def index
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    # ジャンル一覧画面へリダイレクト
    redirect_to '/genres/index'
  end

  def edit
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
end
