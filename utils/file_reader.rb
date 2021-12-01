class FileReader

  def self.read_from_file(input_file)
    input = []
    File.open(input_file) do |f|
      f.each_line do |line|
        line.strip!
        input << line
      end
    end
    input
  end
end
