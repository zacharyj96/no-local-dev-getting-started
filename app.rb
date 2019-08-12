# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Lender < ActiveRecord::Base
  self.table_name = 'salesforce.lender__c'
end

get "/lenders" do
  @lenders = Lender.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
