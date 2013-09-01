module ReadMeEngine

def howto_files(sort= true)

    @howtos = {}
    Dir.foreach("./app/views/HOWTOS") do |fname|
      if fname.end_with?(".markdown")
        title = fname.chomp(".markdown")
        @howtos[title] = File.open("./app/views/HOWTOS/"+ fname).read
      end
    end
    if params[:sort]
      @howtos.sort
    else
  	  @howtos
  	end
end
end
