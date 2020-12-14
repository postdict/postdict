class SearchController < ApplicationController
  before_action :redirect_unauthorized
  before_action :redirect_nonadmin, { only: [ :new, :create, :edit ] }

  @@noun_form_names = [
    "__ V",
    "__ BE",
    "V __",
    "BE __",
    "P __",
    "there BE __",
    "名詞句のみ"
  ]

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

  def new
    @noun = Noun.new()
  end

  def create
    word = params[:word]

    if word.blank?
      redirect_to "/search/new"
      return
    end

    if !(Noun.find_by(noun: word).nil?)
      flash[:alert] = "すでに存在する単語です。別の単語を指定してください。"
      redirect_to "/search/new"
      return
    end

    @noun = Noun.create(noun: word)

    @noun_rows = []
    @@noun_form_names.each do |noun_form_name|
      @noun_rows << @noun.noun_rows.create(noun_form_name: noun_form_name)
    end

    flash[:notice] = "単語を作成しました。"
    redirect_to "/search/#{@noun.noun}/edit"
  end

  def edit
    @noun = Noun.find_by(noun: params[:noun])
    @prequizzes = Quiz.where(original_noun: params[:noun], kind: "pre")
    @postquizzes = Quiz.where(original_noun: params[:noun], kind: "post")

    @noun_rows = []
    @@noun_form_names.each do |noun_form_name|
      @noun_rows << @noun.noun_rows.find_by(noun_form_name: noun_form_name)
    end
  end

  def show
    @noun = Noun.find_by(noun: params[:noun])
    @prequizzes = Quiz.where(original_noun: params[:noun], kind: "pre")
    @postquizzes = Quiz.where(original_noun: params[:noun], kind: "post")

    @noun_rows = []
    @@noun_form_names.each do |noun_form_name|
      @noun_rows << @noun.noun_rows.find_by(noun_form_name: noun_form_name)
    end
  end

  def destroy
    @noun = Noun.find_by(noun: params[:noun])
    @quizzes = Quiz.where(original_noun: params[:noun])

    flash[:notice] = "#{@noun.noun}の単語情報を削除しました。"

    @noun.destroy
    @quizzes.each { |quiz| quiz.destroy }

    redirect_to "/search"
  end
end
