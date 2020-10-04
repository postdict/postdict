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
    @prequizes = Prequiz.where(original_noun: params[:noun])

    noun_form_names = [
      "__ V",
      "__ BE",
      "V __",
      "BE __",
      "P __",
      "there BE __",
      "名詞句のみ"
    ]

    @noun_rows = []
    noun_form_names.each do |noun_form_name|
      @noun_rows << @noun.noun_rows.find_by(noun_form_name: noun_form_name)
    end
  end

end
