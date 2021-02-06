class Artist
    @@all = []
    attr_accessor :name, :artist, :song
    def initialize(name)
        @name = name
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
    def self.find_or_create_by_name(artist_name)
        find_artist = self.all.find {|artist_object| artist_object.name == artist_name}
        if find_artist
            find_artist
        else
            Artist.new(artist_name)
        end
    end
    def print_songs
        self.songs.each do |song_object|
            puts song_object.name
        end
    end
end