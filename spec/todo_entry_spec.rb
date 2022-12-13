require 'todo_entry'

describe DiaryEntry do
    it "initialises with a string" do
      todo = Todo.new("wash the car")
      expect(todo.task).to eq "wash the car"
    end

    it "throws an error if todo is not initialised with a string" do
      expect{ Todo.new({"key": 23}) }.to raise_error "Please provide a string value"
    end

    it "marks a todo as done" do
      todo = Todo.new("wash the car")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
end