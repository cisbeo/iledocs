class ReadMeEngine

def readme_files(:sort => true)

    @howtos = {}
    Dir.foreach("./app/views/HOWTOS") do |fname|
      if fname.end_with?(".markdown")
        title = fname.chomp(".markdown")
        @howtos[title] = File.open("./app/views/HOWTOS/"+ fname).read
      end
    end
    if sort
      @howtos.sort
    else
  	  @howtos
  	end
end
