class LongestRepeatedSubstring
  def self.find_longest_repeated_subtring(string_to_examin)
    @queue = []
    @searched = []
    split_index = string_to_examin.length / 2

    @queue << string_to_examin[0..(split_index - 1)]
    @queue << string_to_examin[(split_index)..(string_to_examin.length - 1)]

    match_engine(string_to_examin)
  end
  
  private
  
  def self.build_queue(string_to_examin)
    @queue << string_to_examin[1..(string_to_examin.length - 1)]
    @queue << string_to_examin[0..(string_to_examin.length - 2)]
  end
  
  def self.match_engine(string_to_examin)
    pattern = next_value()
    
    while (/#{pattern}#{pattern}/ =~ string_to_examin).nil? do
      build_queue(pattern)
      pattern = next_value()
    end
    
    puts pattern unless pattern.length == 1
  end
  
  def self.next_value
    value = @queue[0]
    @queue.delete_at(0)
    
    while (@searched.select { |search| search == value }).length > 0 do
      value = @queue[0]
      @queue.delete_at(0)
    end
    
    @searched << value
    value
  end
end