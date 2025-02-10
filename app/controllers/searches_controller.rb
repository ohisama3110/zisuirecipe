class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:query]
    @search_target = params[:model]
  
    if @search_target == "recipe"
      @results = Recipe.search(@query)
      render 'recipes/search_recipe'
    elsif @search_target == "user"
      @results = User.search(@query)
      render 'users/search_users'
    else
      # 例外処理など、適切な処理を追加
    end
  
    if @results.empty?
      flash.now[:notice] = "検索結果が見つかりませんでした。"
    end
  end

end
