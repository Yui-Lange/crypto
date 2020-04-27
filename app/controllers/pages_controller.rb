class PagesController < ApplicationController
  def index

    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=4b9a7fa0-917a-425d-b627-b292dc733d46&start=1&limit=100&convert=USD'
    @url = URI(@url)
    @response = Net::HTTP.get(@url)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC"]
  end

  def about
  end

  def service
  end

  def lookup

    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=4b9a7fa0-917a-425d-b627-b292dc733d46&start=1&limit=100&convert=USD'
    @url = URI(@url)
    @response = Net::HTTP.get(@url)
    @lookup_coin = JSON.parse(@response)

    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = "Hey you forgot to enter a crrency"
    end


  end
end
