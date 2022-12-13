# Multi-Class Planned Design Recipe

## 1. Describe the Problem
    As a user
    So that I can record my experiences
    I want to keep a regular diary

    As a user
    So that I can reflect on my experiences
    I want to read my past diary entries

    As a user
    So that I can reflect on my experiences in my busy day
    I want to select diary entries to read based on how much time I have and my reading speed

    As a user
    So that I can keep track of my tasks
    I want to keep a todo list along with my diary

    As a user
    So that I can keep track of my contacts
    I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System
See recipie-plan.png

## 3. Create Examples as Integration Tests
```ruby

# return all entries
journal = Journal.new
entry1 = DiaryEntry.new("Dear diary...")
entry2 = DiaryEntry.new("Dear diary blah blah")
journal.add_entry(entry1)
journal.add_entry(entry2)
journal.diary_entries # => [entry1, entry2]

# return all readable entries given wpm and time
journal = Jounral.new
entry1 = DiaryEntry.new("This is a ten word diary entry one two three")
entry2 = DiaryEntry.new("This sentence is five words")
journal.add_entry(entry1)
journal.add_entry(entry2)
journal.entries_that_can_be_read(5, 1) # => ("This sentence is five words") // entry2

# find phone numbers
journal = Journal.new
entry1 = DiaryEntry.new("This is a ten word 07123457837 diary entry one two three")
entry2 = DiaryEntry.new("This sentence is five words")
entry3 = DiaryEntry.new("This sentence is five words 07987236475")
journal.add_entry(entry1)
journal.add_entry(entry2)
journal.add_entry(entry3)
journal.find_phone_numbers # => [07123457837, 07987236475]

# add task to journal
journal = Journal.new
task1 = Todo.new("wash the car")
journal.add_task(task1) # => [task1]

# show incomplete tasks
journal = Journal.new
task1 = Todo.new("wash the car")
task2 = Todo.new("wash the dog")
task3 = Todo.new("wash the log")
task3.mark_done!
journal.incomplete # => [task1, task2]

# show complete tasks
journal = Journal.new
task1 = Todo.new("wash the car")
task2 = Todo.new("wash the dog")
task3 = Todo.new("wash the log")
task3.mark_done!
journal.complete # => [task3]


# mark all tasks as complete and return them
journal = Journal.new
task1 = Todo.new("wash the car")
task2 = Todo.new("wash the dog")
task3 = Todo.new("wash the log")
journal.give_up!
journal.complete # => [task1, task2, task3]


```

## 4. Create Examples as Unit Tests

```ruby
# TODO

# throw an error if todo is not initalised with a string
Todo.new({"key": 23}) # => error "Please provide a string value"

# mark a todo as done
todo = Todo.new("Go for a run")
todo.mark_done!
todo.done? # => true

# DiaryEntry

# throw an error if todo is not initalised with a string
DiaryEntry.new({"key": 23}) # => error "Please provide a string value"

# returns word count of diary entry
entry1 = DiaryEntry.new("There are five words here")
entry1.num_words # => 5

# intializes with a task
entry = DiaryEntry.new("This is a new entry")
entry.contents # => "This is a new entry"

```

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._