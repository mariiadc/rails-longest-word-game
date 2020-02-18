# frozen_string_literal: true

require 'open-uri'
# comment
class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('A'...'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].chars
    @grid_hash = Hash.new(0)
    url = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    @dictionary = JSON.parse(url.read)
    # if @dictionary["found"]
    #   @letters.each { |a| @grid_hash[a.downcase] += 1 }
    #   @word.chars.each { |a| @grid_hash[a.to_s.downcase] -= 1 }
    #   if @grid_hash.values.all? { |v| v >= 0 }
    #     @results = "Congratulation! #{@word} is a valid English word!"
    #   else
    #     @results = "Sorry but #{@word} can't be built out of "
    #   end
    # else
    #   @results = "Sorry but #{@word} does not seem to be a valid English word..."
    # end
  end
end
