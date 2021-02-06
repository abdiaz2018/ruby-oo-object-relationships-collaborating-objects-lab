class Song
    @@all = []
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename)
        split_array = filename.split(" - ")
        song_1 = Song.new(split_array[1])
        song_1.artist_name=(split_array[0])
        song_1
    end
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end