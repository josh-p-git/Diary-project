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
See diary-recipie.png

class DiarySystem
    def initialize
    #
    end

    def add_diary_entry
    # adds diary entry via diary class
    end

    def view_diary
    # displays all added diary entries
    end

    def view_diary_wpm(wpm, time)
    # displays all diary entries readable based on wpm and time available
    end

    def add_todo
    # adds todo entry via todo class
    end

    def view_todo
    # displays all todo entries
    end

    def mobile_numbers
    # displays all mobile numbers within diary entries via mobile class
    end
end

class Diary
    def initialize(contents)
    # initialize diary entry taking contents
    end

    def contents
    # returns contents
    end
end

class Todo
    def initialize(item)
    # initialize todo list item taking item
    end

    def todo_item
    # returns todo item
    end
end

class Mobile
    def initialize
    # 
    end

    def mobile_search
    # searches saved diary entries for mobile numbers and returns them
    end
end



## 3. Create Examples as Integration Tests


## 4. Create Examples as Unit Tests


## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._