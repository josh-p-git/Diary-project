require "diary_entry"
require "journal"
require "todo_entry"

describe "Journal integration" do
  
  it "returns all entries" do
    journal = Journal.new
    entry1 = DiaryEntry.new("Dear diary...")
    entry2 = DiaryEntry.new("Dear diary blah blah")
    journal.add_entry(entry1)
    journal.add_entry(entry2)
    expect(journal.diary_entries).to eq [entry1, entry2]
  end

  it "adds a new diary entry" do
    journal = Journal.new
    entry = DiaryEntry.new("Dear diary...")
    journal.add_entry(entry)
    expect(journal.diary_entries).to eq [entry]
  end

  it "returns all readable entries given wpm and time" do
    journal = Journal.new
    entry1 = DiaryEntry.new("This is a ten word diary entry one two three")
    entry2 = DiaryEntry.new("This sentence is five words")
    journal.add_entry(entry1)
    journal.add_entry(entry2)
    expect(journal.entries_that_can_be_read(5, 1)).to eq [entry2]
  end

  it "adds a task to the journal" do
    journal = Journal.new
    task = Todo.new("wash the car")
    journal.add_task(task)
    expect(journal.incomplete).to eq [task]
  end

  it "shows all incompete tasks" do
    journal = Journal.new
    task1 = Todo.new("wash the car")
    task2 = Todo.new("wash the dog")
    task3 = Todo.new("wash the log")
    journal.add_task(task1)
    journal.add_task(task2)
    journal.add_task(task3)
    task3.mark_done!
    expect(journal.incomplete).to eq [task1, task2]
  end

  it "shows all complete tasks" do
    journal = Journal.new
    task1 = Todo.new("wash the car")
    task2 = Todo.new("wash the dog")
    task3 = Todo.new("wash the log")
    task3.mark_done!
    journal.add_task(task1)
    journal.add_task(task2)
    journal.add_task(task3)
    expect(journal.complete).to eq [task3]
  end

  it "marks all tasks as complete and returns them" do
    journal = Journal.new
    task1 = Todo.new("wash the car")
    task2 = Todo.new("wash the dog")
    task3 = Todo.new("wash the log")
    journal.add_task(task1)
    journal.add_task(task2)
    journal.add_task(task3)
    journal.give_up!
    expect(journal.complete).to eq [task1, task2, task3]
  end

  it "return an array of phone numbers" do
    journal = Journal.new
    entry1 = DiaryEntry.new("This is a ten word 07123457837 diary entry one two three")
    entry2 = DiaryEntry.new("This sentence is five words")
    entry3 = DiaryEntry.new("This sentence is five words 07987236475")
    journal.add_entry(entry1)
    journal.add_entry(entry2)
    journal.add_entry(entry3)
    expect(journal.find_phone_numbers).to eq ['07123457837', '07987236475']
  end
end