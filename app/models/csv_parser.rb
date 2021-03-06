require 'csv'

class CsvParser


  def self.populate
    
    # Populate object first
  populate_object_program
    # Populate file object
  populate_object_fileDB
    #Then parse and populate ILEDOCS files
  populate_program_doc
  populate_procedure_doc
  populate_fileDB_doc

  puts "populate DB is ended normally"
  end


  def self.populate_object_program
    puts "populating objects program database..."
    puts "objects program database not yet exist ;)"
  end

  def self.populate_object_fileDB
    puts "populating objects program database..."
    puts "objects program database not yet exist ;)"
  end

  def self.populate_program_doc
    @count = 0
    @count1 = 0
    puts "populating program documents ..."
    CSV.foreach(::Rails.root.join('echange','in','ILEDBASE-program-UTF-8.csv')) do |row|

        empty = Document.where("doctype= ? and member = ?", 'PROGRAM', row[2].strip.upcase).empty?
        many = Document.where("doctype= ? and member = ?", 'PROGRAM', row[2].strip.upcase).many?
        if !empty and !many
          current_document = Document.where("doctype= ? and member = ?", 'PROGRAM', row[2].strip.upcase).first
          current_document.tags << Tag.new(:name => row[5].strip.upcase, :value => row[6])
        else
          @count1 = @count1+1
          current_document = Document.new(:library => row[0].strip.upcase, :srcfile => row[1].strip.upcase, 
        :member => row[2].strip.upcase, :name => row[4].strip.upcase, :doctype => row[3].strip.upcase)
          current_document.tags << Tag.new(:name => row[5].strip, :value => row[6])
        end
        current_document.save
        @count = @count + 1
    end


    puts @count.to_s + " program lines analysed"
    puts @count1.to_s + " program description added"
    puts "program documentation database is populated"

  end

  def self.populate_procedure_doc
    @count = 0
    @count1 = 0
    puts "populating procedure documents ..."

      CSV.foreach(::Rails.root.join('echange','in','ILEDBASE-procedure-UTF-8.csv')) do |row|

        empty = Document.where("doctype= ? and name = ?", 'PROCEDURE', row[4].strip).empty?
        many = Document.where("doctype= ? and name = ?", 'PROCEDURE', row[4].strip).many?
        if !empty and !many
          @count1 = @count1+1
          current_document = Document.where("doctype= ? and name = ?", 'PROCEDURE', row[4].strip).first
          current_document.tags << Tag.new(:name => row[5].strip, :value => row[6])
        else
          current_document = Document.new(:library => row[0].strip.upcase, :srcfile => row[1].strip.upcase, 
        :member => row[2].strip.upcase, :name => row[4].strip, :doctype => row[3].strip.upcase)
          current_document.tags << Tag.new(:name => row[5].strip, :value => row[6])
        end
        current_document.prog = Document.where("doctype= ? and member = ?", 'PROGRAM', row[2].strip.upcase).first
        current_document.save
        @count= @count +1
    end
    
    puts @count.to_s + " procedure lines analysed"
    puts @count1.to_s + " procedure description added"
    puts "procedure documentation database is populated"
  end
  
  def self.populate_fileDB_doc
    @count = 0
    @count2 = 0
    puts "populate file database documents ..."
    
    #@logFile = File.new(::Rails.root.join('log','csv_parser.log'), "w")

    CSV.foreach(::Rails.root.join('echange','in','ILEDBASE-file-UTF-8.csv')) do |row|

      if Document.where("doctype= ? and name = ?", 'FILE', row[4].strip.upcase).empty?
          current_document = Document.new(:library => "", :srcfile => "", 
        :member => row[4].strip.upcase, :name => row[4].strip.upcase, :doctype => row[3].strip.upcase)
      #    current_document.tags << Tag.new(:name => row[5].strip, :value => row[6])
        if calling_program = Document.where("doctype = ? and name = ?", 'PROGRAM', row[2].strip.upcase).first
          current_document.ancestors << calling_program
        else
          # le source d'ou est extrait ce fichier n'est pas trouver dans la BD. Il y a sans doute un problème au niveau de ILEDOC. 
          # le source n'a pas été parsé par ILEDOCS
          if Document.where("doctype= ? and member = ?", 'PROGRAM', row[2].strip.upcase).empty?
            program_not_parsed = Document.create(:library => row[0].strip.upcase, :srcfile => row[1].strip.upcase, 
              :member => row[2].strip.upcase, :name => row[2].strip.upcase, :doctype => 'PROGRAM')
            program_not_parsed.tags << Tag.new(:name => 'brief', :value => 'source not parsed')
            program_not_parsed.tags << Tag.new(:name => 'desc', :value => 'source not parsed')
            current_document.ancestors << program_not_parsed
            @count2 = @count2+1
          end
        end
        current_document.save    
      end
    @count = @count + 1
    end
    #@logFile.write(@count2.to_s + 'program not found in csv file from ILEDOCS.Search "source not parsed"')
    #@logFile.close

    puts @count.to_s + " file doc lines added"
    puts "objects procedure documentation database is populated"
  end
  
  def self.trunk
    infile = File.open(::Rails.root.join('echange','in','ILEDBASE-UTF-8.csv'))
    progfile = File.open(::Rails.root.join('echange','in','ILEDBASE-program-UTF-8.csv'), "w")
    procfile = File.open(::Rails.root.join('echange','in','ILEDBASE-procedure-UTF-8.csv'), "w")
    filefile = File.open(::Rails.root.join('echange','in','ILEDBASE-file-UTF-8.csv'), "w")
    #TODO : intégrer les DSPOBJD des programmes et des fichier DB
#    objectprogramfile = File.open("./echange/in/NOLS-object-program-UTF-8.csv", "w")
#    fileDBfile = File.open("./echange/in/NOLS-object-fileDB-UTF-8.csv", "w")
    @row = 0
      infile.each do |row|
        if row.include? ',"file                ",'
          filefile.puts row
        end
        if row.include? ',"program             ",'
          progfile.puts row
        end
        if row.include? ',"procedure           ",'
          procfile.puts row
        end
        @row = @row+1
      end
    puts @row.to_s + " lines dispatched."
  end

end




