class SecondClass 
  def add_elements(arr)
    arr.push(4, 5)

    puts arr.to_s
  end

  def remove_last(arr)
    last_element = arr.pop

    puts last_element
  end

  def remove_first(arr)
    arr.shift

    puts arr.to_s
  end

  def add_at_start(arr)
    arr.unshift("start")

    puts arr.to_s
  end

  def remove_duplicates(arr)
    uniq_arr = arr.uniq

    puts uniq_arr.to_s
  end

  def get_fist(arr)
    first_element = arr.first
    
    puts first_element
  end

  def get_last(arr)
    last_element = arr.last
    
    puts last_element
  end

  def contains_seven?(arr)
    puts arr.include?(7) 
  end

  def double_numbers(arr)
    doubled_arr = arr.map { |num| num * 2 }

    puts doubled_arr.to_s
  end

  def get_evens(arr)
    evens = arr.select { |num| num.even? }

    puts evens.to_s
  end

  def remove_odds(arr)
    evens = arr.select { |num| num.even? }

    puts evens.to_s
  end

  def remove_nils(arr)
    cleaned_arr = arr.compact!

    puts cleaned_arr.to_s
  end

  def merge_unique_sorted(arr1, arr2)
    merged_arr = (arr1 + arr2).uniq.sort

    puts merged_arr.to_s
  end

  def most_frequent(arr)
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    most_frequent = arr.max_by { |v| freq[v] }

    puts most_frequent
  end
end

second_class = SecondClass.new

second_class.add_elements([1, 2, 3])

second_class.remove_last([10, 20, 30])

second_class.remove_first(["apple", "banana", "cherry"])

second_class.add_at_start(["middle", "end"])

second_class.remove_duplicates([1, 2, 2, 3, 4, 4, 5])

second_class.get_fist([100, 200, 300])

second_class.get_last(["red", "blue", "green"])

second_class.contains_seven?([1, 3, 5, 7, 9])

second_class.contains_seven?([2, 4, 6, 8])

second_class.double_numbers([1, 2, 3, 4])

second_class.get_evens([1, 2, 3, 4, 5, 6])

second_class.remove_odds([1, 2, 3, 4, 5, 6])

second_class.remove_nils([1, nil, 2, nil, 3])

second_class.merge_unique_sorted([3, 1, 4], [4, 5, 6, 1])

second_class.most_frequent([1, 2, 3, 2, 4, 2, 5])

second_class.most_frequent(["apple", "banana", "apple", "cherry"])