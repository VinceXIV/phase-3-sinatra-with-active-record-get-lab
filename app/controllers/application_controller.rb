class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # add routes
  get '/bakeries' do 
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    BakedGood.all.sort_by {|good| -good.price}.to_json
  end

  get '/baked_goods/most_expensive' do
    max_price = BakedGood.maximum(:price).to_json
    BakedGood.find_by(price: max_price).to_json
  end
end
