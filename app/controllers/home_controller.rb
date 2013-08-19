class HomeController < ApplicationController
  def index

    @documents = Document.all.last(6).reverse
    @programs_count = Document.where("doctype=?", "PROGRAM").count
    @procedures_count = Document.where("doctype=?", "PROCEDURE").count
    @files_count = Document.where("doctype=?", "FILE").count
    file =  File.open("./app/views/HOWTO_DOC.markdown")
    @howtodoc = file.read
    file =  File.open("./app/views/HOWTO_SEARCH.markdown")
    @howtosearch = file.read
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end

  end
end
