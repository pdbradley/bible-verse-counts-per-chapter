require 'byebug'
require 'json'

# I want a hash so I can do my_hash['1']['22'] and get back the number of verses in Genesis chapter 22
# that's what this builds


file = File.open("bible.json")

stuff = JSON.parse(file.read)

hash_keyed_on_book_number = Hash[stuff.map do |item| 
  [item['book_number'], 
   Hash[item['chapters'].map{|chapters| [chapters['chapter'], chapters['verses']]}]
  ]
end]


