namespace :nolsdocs do
task :docscleardb => :environment do
  puts "Clearing all Documents ..."
  Document.delete_all
  puts "Documents are deleted"
  puts "Clearing all Tags ..."
  Tag.delete_all
  puts "Tags are deleted"
  Link.delete_all
  puts "links are deleted"
end

task :populate_object_program => :environment do
	if File.exists?("./echange/in/NOLS-object-program-UTF-8.csv")
		
		if File.delete("./echange/in/NOLS-object-program-UTF-8.csv")
		  puts "NOLS-object-program-UTF-8.csv deleted ..."
		else
		  puts "failed: cannot delete file NOLS-object-program-UTF-8.csv !! "
		  return
		end
    else
      puts "file NOLS-object-program-UTF-8.csv does not exist!! "
	end
end

task :populate_object_fileDB => :environment do
	if File.exists?("./echange/in/NOLS-object-fileDB-UTF-8.csv")
		
		if File.delete("./echange/in/NOLS-object-fileDB-UTF-8.csv")
		  puts "NOLS-object-program-UTF-8.csv deleted ..."
		else
		  puts "failed: cannot delete file NOLS-object-fileDB-UTF-8.csv !! "
		  return
		end
    else
      puts "file NOLS-object-fileDB-UTF-8.csv does not exist!! "
	end
end

task :populate_program_doc => :environment do
	if File.exists?("./echange/in/ILEDBASE-program-UTF-8.csv")
		
		if File.delete("./echange/in/ILEDBASE-program-UTF-8.csv")
		  puts "ILEDBASE-program-UTF-8.csv deleted ..."
		else
		  puts "failed: cannot delete file ILEDBASE-program-UTF-8.csv !! "
		  return
		end
    else
      puts "file ILEDBASE-program-UTF-8.csv does not exist!! "
	end
end

task :populate_procedure_doc => :environment do
	if File.exists?("./echange/in/ILEDBASE-procedure-UTF-8.csv")
		if File.delete("./echange/in/ILEDBASE-procedure-UTF-8.csv")
		  puts "ILEDBASE-procedure-UTF-8.csv deleted ..."
		else
		  puts "failed: cannot delete file ILEDBASE-procedure-UTF-8.csv !! "
		  return
		end
    else
      puts "file ILEDBASE-procedure-UTF-8.csv does not exist!! "
	end
end

task :populate_fileDB_doc => :environment do
	if File.exists?("./echange/in/ILEDBASE-file-UTF-8.csv")
		if File.delete("./echange/in/ILEDBASE-file-UTF-8.csv")
		  puts "ILEDBASE-file-UTF-8.csv deleted ..."
		else
		  puts "failed: cannot delete file ILEDBASE-file-UTF-8.csv !! "
		  return
		end
    else
      puts "file ILEDBASE-file-UTF-8.csv does not exist!! "
	end
end


task :populatedb => [:populate_object_program,
                     :populate_object_fileDB,
                     :populate_program_doc,
                     :populate_procedure_doc,
                   #  :populate_fileDB_doc, 
                     :dispatchCSVfile, 
                     :populateDBdoc]

	# if File.exists?("./echange/in/NOLS-object-program-UTF-8.csv")
		# 
		# if File.delete("./echange/in/NOLS-object-program-UTF-8.csv")
		  # puts "NOLS-object-program-UTF-8.csv deleted ..."
		# else
		  # puts "failed: cannot delete file NOLS-object-program-UTF-8.csv !! "
		  # return
		# end
	# end
# 
	# if File.exists?("./echange/in/NOLS-object-fileDB-UTF-8.csv")
		# 
		# if File.delete("./echange/in/NOLS-object-fileDB-UTF-8.csv")
		  # puts "NOLS-object-fileDB-UTF-8.csv deleted ..."
		# else
		  # puts "failed: cannot delete file NOLS-object-program-UTF-8.csv !! "
		  # return
		# end
	# end
# 
	# if File.exists?("./echange/in/ILEDBASE-program-UTF-8.csv")
		# 
		# if File.delete("./echange/in/ILEDBASE-program-UTF-8.csv")
		  # puts "ILEDBASE-program-UTF-8.csv deleted ..."
		# else
		  # puts "failed: cannot delete file ILEDBASE-program-UTF-8.csv !! "
		  # return
		# end
	# end
	# if File.exists?("./echange/in/ILEDBASE-procedure-UTF-8.csv")
		# if File.delete("./echange/in/ILEDBASE-procedure-UTF-8.csv")
		  # puts "ILEDBASE-procedure-UTF-8.csv deleted ..."
		# else
		  # puts "failed: cannot delete file ILEDBASE-procedure-UTF-8.csv !! "
		  # return
		# end
	# end
	# if File.exists?("./echange/in/ILEDBASE-file-UTF-8.csv")
		# if File.delete("./echange/in/ILEDBASE-file-UTF-8.csv")
		  # puts "ILEDBASE-file-UTF-8.csv deleted ..."
		# else
		  # puts "failed: cannot delete file ILEDBASE-file-UTF-8.csv !! "
		# end
	# end


task :dispatchCSVfile => :environment do
  puts "dispatching csv files..."
  CsvParser.trunk
  puts "Files are dispatched"
end

task :populateDBdoc => :environment do
  puts "populating Docs Database..."
  CsvParser.populate
end

task :all => [:docscleardb, :populatedb]

end
