class MP3Importer

    attr_accessor :path

    @@files = []

    def initialize(path)
        @path = path
        @@files << self
    end

    def files
    all_files = Dir.entries(@path).select {|f| !File.directory? f}
    all_mp3_files = all_files.select do |file|
      file.end_with?(".mp3")
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end