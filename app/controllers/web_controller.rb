class WebController < ApplicationController
  def index
    render json: "success!"
  end
end
