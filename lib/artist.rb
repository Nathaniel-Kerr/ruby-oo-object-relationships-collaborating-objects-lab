class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.create_by_name(name)
        artist = self.new(name)
        artist
    end

    def self.find_by_name(name)
        result = nil
        @@all.each do |song| 
        result = song if song.name == name
            end
        result
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end

    def print_songs
    self.songs.each do |song| 
        puts song.name
        end
    end
end