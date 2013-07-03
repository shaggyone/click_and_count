describe 'Pluralizer:', ->
  describe 'pluralize for 1', ->
    it 'is matches for 1, 21, 31, 101, 1031 ...', ->
      numbers = [1, 21, 31, 101, 1031]
      expect(@Pluralizer.pluralize(number, 'яблоко', 'яблока', 'яблок')).toEqual 'яблоко' for number in numbers

  describe 'pluralize for some', ->
    it 'is matches for 2, 3, 4, 22, 23, 23, 102, 103, 104, 1002, 1003, 1004', ->
      numbers = [2, 3, 4, 22, 23, 23, 102, 103, 104, 1002, 1003, 1004]
      expect(@Pluralizer.pluralize(number, 'яблоко', 'яблока', 'яблок')).toEqual 'яблока' for number in numbers

  describe 'pluralize for many', ->
    it 'is matches for 2, 3, 4, 22, 23, 23, 102, 103, 104, 1002, 1003, 1004', ->
      numbers = [0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 100, 105, 106, 107, 108, 109, 1010]
      expect(@Pluralizer.pluralize(number, 'яблоко', 'яблока', 'яблок')).toEqual 'яблок' for number in numbers
