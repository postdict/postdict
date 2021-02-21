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

    @noun_form_names = [
      "__ V",
      "__ BE",
      "V __",
      "BE __",
      "P __",
      "there BE __",
      "名詞句のみ"
    ]

    # @noun_rows = []
    # noun_form_names.each do |noun_form_name|
    #   @noun_rows << @noun.noun_rows.find_by(noun_form_name: noun_form_name)
    # end
    @noun_rows = Array.new(7)
    for k in 0..6
      @noun_rows[k] = Array.new(4)
    end

    for i in 0..6
        for j in 0..3
          if(@noun.noun_rows.where(row_num: i, column_num: j).present?)
            @noun_rows[i][j] = @noun.noun_rows.where(row_num: i, column_num: j)
          end
        end
    end
  end

end
