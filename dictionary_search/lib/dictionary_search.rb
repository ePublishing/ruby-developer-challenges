class DictionarySearch
  def initialize(file_path)
    @pairs = []
    @dictionary = {}
    File.open(file_path).each do |this_line|
      word = this_line.chomp
      if word.length < 3
        next
      else
        @pairs << @dictionary[word] unless @dictionary[word].nil?
        alt_word = word[0..-3] + word[-1] + word[-2]
        @dictionary[word] = [alt_word, word]
        @dictionary[alt_word] = @dictionary[word]
      end
    end
  end

  def word_pairs
    @pairs
  end
end
