require "csv"
require "set"

FILE_PATH = "test.csv"

a_ids = []
b_ids = []

CSV.foreach(FILE_PATH, headers: false).with_index(1) do |row, line_no|
  a = row[0]&.to_s&.strip
  b = row[1]&.to_s&.strip

  a_ids << a unless a.nil? || a.empty?
  b_ids << b unless b.nil? || b.empty?
end

a_set = a_ids.to_set
b_set = b_ids.to_set

only_in_a = a_set - b_set
only_in_b = b_set - a_set
common = a_set & b_set

puts "A列の件数: #{a_ids.size}"
puts "B列の件数: #{b_ids.size}"
puts "A列のみ: #{only_in_a.size}"
puts "B列のみ: #{only_in_b.size}"
puts "両方にある: #{common.size}"

puts
puts "=== A列にあってB列にないID ==="
only_in_a.each { |id| puts id }

puts
puts "=== B列にあってA列にないID ==="
only_in_b.each { |id| puts id }