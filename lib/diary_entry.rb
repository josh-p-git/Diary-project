class DiaryEntry
  def initialize(contents)
    raise "Please provide a string value" if contents.class != String
    @contents = contents
  end

  def contents
    @contents
  end

  def num_words
    @contents.split(" ").length
  end
end
