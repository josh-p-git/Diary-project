class Todo
  def initialize(task)
    raise "Please provide a string value" if task.class != String
    @task = task
    @done = false
  end

  def task
    @task
  end

  def mark_done!
    @done = true
  end

  def done?
   @done
  end
end