require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize #initializes
    @name = name
    @artist_name = artist_name
    save #this will sinitialize a save in whatever needs to be saved under
  end


  def self.all #calls the class and puts it out
    @@all
  end

  def save #the save method that will be initialized
    self.class.all << self
  end

  def self.create #will create a new song
    self.new #calls the class then .new to create a new song
  end

  def self.new_by_name(name)  #calls class to make a new name through name argument
           song = self.new #song is created and put in song variable
            song.name = name #song will then be added a name
            song #puts out song
          end

  def self.create_by_name(name) #initiates and saves song with name property
          song = self.create #can call above method of create to ccreate the song
          song.name = name  #gives the created song a name
          song # calls it out
  end

  def self.find_by_name(name) #calls class to find by name, taking the argument of the name
    self.all.find {|song| song.name == name }  #calls the class to look through all, then  goes through the song, song.name to == the name int he argument
  end

  def self.find_or_create_by_name(name) #take an argument of the name as that is what we are finding
    song = self.find_by_name(name) #make a variable to contain the helper method

    if song #if that is the name being found int he argument
      song #put it out
 
    else self.create_by_name(name) #else call the create helper method to call it out
    end
  end

  def self.alphabetical #class method for alphabetical (NO NEED FOR ARGUMENT BECAUSE NOT CALLING ANYTHING IN JUST SORTING)

    songs = @@all.sort_by {|song| song.name } #put in variable, using @@all because its all the songs saved in the array, then sort by song name
    songs #calls out variable to display array
  end

  def self.new_from_filename(filename) #going to take in filename
    
    file = filename.split(" - ") #take out the " - " to split the song ang artist
    file[1].slice! ".mp3"#remove the .mp3
    song = self.new #make a new song
    song.name = file[1] #add in the variable witht he song name
    song.artist_name = file[0] #makes the artist_name the file witht he artist
    song   #call it
      # binding.pry

  end

  def self.create_from_filename(filename)

    song = self.new_from_filename(filename) #makes a song variable to make a new file from the filename method
    @@all << song #push it into the @@all array
    @@all #call it
  end

  def self.destroy_all

    @@all.clear #clears the array

  end

end
