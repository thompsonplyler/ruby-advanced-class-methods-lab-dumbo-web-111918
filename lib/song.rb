require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
  end

  def self.create #most basic constructor
    song = self.new
    #song.name = name
    #song.artist_name = artist_name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name) #constructor with name
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name) #finder method
    @@all.find {|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
   find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    song.name = file.split(" - ")[1].chomp(".mp3")
    song.artist_name = file.split(" - ")[0]
    # @@all << song
    song
  end

  def self.create_from_filename(file)
    @@all << new_from_filename(file)
  end


  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

# Song.create_by_name("Enter Sandman")
# Song.create_by_name("Sad But True")
# Song.create_by_name("Master of Puppets")
# Song.create_by_name("Ride the Lightning")
# Song.create_by_name("Fade to Black")
# Song.create_by_name("Blackened")
# Song.create_by_name("The Four Horseman")
# Song.create_by_name("The Struggle Within")
#
#
# binding.pry
