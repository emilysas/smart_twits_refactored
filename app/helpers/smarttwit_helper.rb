module Helper

  REJECT_WORDS = ['rt', 'it', 'was', 'i','a', 'to', 'the', 'on', 'for', 'am','at', 'of', 'do', 'you', 'be', 'in', 'and', 'he', 'with', 'that', 'what', 'are', 'as', 'an', 'all', 'we', "is", "", "can", "this", "now", "your", "you're", "this", "by", "http", "htt"]
  UNWANTED_CHARACTERS = /\B[@#]\S+\b|(?:f|ht)tps?:\/[^\s]+|[^a-zA-Z0-9%\s]/

  def read_file path
    file = File.open path
    array = read_info_from file
  end

  def read_info_from file
    array = []
    file.readlines.each {|el| array << eval(el.chomp)} 
    file.close()
    array
  end

  def parse_file path, regex
    text = File.read path
    text.scan(regex).flatten
  end

  def extract_words_from array
    array.join(" ").split(" ").map{ |word| word.downcase.gsub(UNWANTED_CHARACTERS, "")}
  end

  def reject_words_from array
    array.reject {|word| REJECT_WORDS.include?(word) }
  end

  def count_freq_within array
    word_freq = Hash.new(0)
    array.each {|word| word_freq[word]+=1}
    word_freq
  end

  def filter_top_results(number, hash)
    hash.sort_by {|key, value| value}.reverse[0..(number-1)]
  end

  def find_top_words(number, array)
    useful_words = find_words_from array
    frequency_hash = count_freq_within useful_words
    filter_top_results(number, frequency_hash)
  end

  def find_words_from array
    all_words = extract_words_from array
    reject_words_from all_words
  end

  def find_args(path, args)
    text_array = read_file(path)
    array = []
    text_array.map { |el| array << [ el[args[0]], el[args[1]] ] }
    array
  end
end
