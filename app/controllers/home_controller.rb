class HomeController < ApplicationController
  def index

    @documents = Document.all.last(6).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end

  end
end
