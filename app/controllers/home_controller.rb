# class HomeController < ApplicationController
#   def index
#     @howtos = []
#     Dir.foreach("./app/views/HOWTOS") do |fname|
#       if fname.end_with?(".markdown")
#       @howtos << fname
#       end
#     end
# puts @howtos.to_s
#     @documents = Document.all.last(6).reverse
#     @programs_count = Document.where("doctype=?", "PROGRAM").count
#     @procedures_count = Document.where("doctype=?", "PROCEDURE").count
#     @files_count = Document.where("doctype=?", "FILE").count
#     file =  File.open("./app/views/HOWTOS/HOWTO_DOC.markdown")
#     @howtodoc = file.read
#     file =  File.open("./app/views/HOWTOS/HOWTO_SEARCH.markdown")
#     @howtosearch = file.read
#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @documents }
#     end

#   end
# end

class HomeController < ApplicationController


  def index
    @howtos = {}
          logger.debug "debug"

    # Dir.foreach("./app/views/HOWTOS") do |fname|
      # if fname.end_with?(".markdown")
        # title = fname.chomp(".markdown")
        # @howtos[title] = File.open("./app/views/HOWTOS/"+ fname).read
      # end
      # @howtos.sort
    # end
    # Todo : Voir écriture module 
    @howtos = ReadMeEngine::howto_files(true)

    @recent_documents = Document.recent
    @programs_count = Document.programs_count
    @procedures_count = Document.procedures_count
    @files_count = Document.files_count
    # file =  File.open("./app/views/HOWTOS/"+ @howtos[0])
    # @howtofiles << file.read
    # file =  File.open("./app/views/HOWTOS/"+ @howtos[1])
    # @howtofiles << file.read
 #   @howtosearch = file.read
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end

  end
end