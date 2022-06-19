class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genre.new
    @genres = Genre.all
    #@genre_edit = Genre.find(params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    # ジャンル一覧画面へリダイレクト
    redirect_to '/admin/genres/index'
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_index_path
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  
  
end
