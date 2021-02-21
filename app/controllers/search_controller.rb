class SearchController < ApplicationController
  before_action :redirect_unauthorized

  def top
  end

  def index
    if params[:word].empty?
      redirect_to "/search"
      return
    end

    @query = params[:word]
    @nouns = Noun.where(noun: @query)
  end

  def show
    @noun = Noun.find_by(noun: params[:noun])
    @prequizzes = Quiz.where(original_noun: params[:noun], kind: "pre")
    @postquizzes = Quiz.where(original_noun: params[:noun], kind: "post")

    noun_form_names = [
      "__ V",
      "__ BE",
      "V __",
      "BE __",
      "P __",
      "there BE __",
      "名詞句のみ"
    ]

    
  end

end
