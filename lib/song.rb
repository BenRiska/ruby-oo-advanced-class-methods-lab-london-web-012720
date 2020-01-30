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
    song.save
    song
  end

  def self.create_by_name(v)
    song = self.new
    song.save
    song.name = v
    song
  end

  def self.new_by_name(v)
    song = self.new
    # song.save
    song.name = v
    song
  end

  def self.find_by_name(v)
    @@all.find {|el| el.name == v}
  end

  def self.find_or_create_by_name(v)
    existing = self.find_by_name(v)
    if existing
      return existing
    else
      self.create_by_name(v)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file)
    n, s = file.split('-')
    s = s.split('.mp3').join.strip
    n = n.strip
    song = self.new
    song.name = s
    song.artist_name = n
    song
  end

  def self.create_from_filename(file)
    n, s = file.split('-')
    s = s.split('.mp3').join.strip
    n = n.strip
    song = self.new
    song.name = s
    song.artist_name = n
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
