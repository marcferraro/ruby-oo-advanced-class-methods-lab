require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    
    song = self.all.find {|n| n.name == name}
      song
  end

  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    alphabetical_array = self.all.sort_by {|n| n.name}
    alphabetical_array
  end

  def self.new_from_filename(filename)
    song_artist = filename.split " - "
    song = self.new
    song.name = song_artist[1].delete_suffix(".mp3")
    song.artist_name = song_artist[0]
    song
  end

  def self.create_from_filename(filename)
    song_artist = filename.split " - "
    song = self.new
    song.name = song_artist[1].delete_suffix(".mp3")
    song.artist_name = song_artist[0]
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
