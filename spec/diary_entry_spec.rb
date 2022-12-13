require "diary_entry"

describe DiaryEntry do
  it "initialises with a string" do
    entry = DiaryEntry.new("Dear Diary")
    expect(entry.contents).to eq "Dear Diary"
  end
  
  it "throws an error if diary is not initialised with a string" do
    expect{ DiaryEntry.new({"key": 23}) }.to raise_error "Please provide a string value"
  end

  it "returns word count of diary entry" do
    entry1 = DiaryEntry.new("There are five words here")
    expect(entry1.num_words). to eq 5
  end
end

