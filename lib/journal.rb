class Journal

  def initialize
    @entries = []
    @tasks = []
  
  end

  def add_entry(entry)
    @entries << entry
  end

  def diary_entries
    # returns an array of instances of DiaryEntry
    @entries
  end

  def entries_that_can_be_read(wpm, minutes)
    # returns an array of instances of DiaryEntry

    words = wpm * minutes
    @entries.select do |entry|
      entry.num_words <= words
    end
  end

  def add_task(task)
    @tasks << task
  end

  def incomplete
    @tasks.select do |todo|
      !todo.done?
    end
  end

  def complete
    @tasks.select do |todo|
      todo.done?
    end
  end

  def give_up!
    @tasks.each do |task|
      task.mark_done!
    end
  end

  def find_phone_numbers
    @entries.flat_map do |entry|
      extract_numbers_from_entry(entry)
    end.uniq
  end

  def extract_numbers_from_entry(entry)
    return entry.contents.scan(/07[0-9]{9}/)
  end
end