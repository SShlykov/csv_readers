require 'csv'

result = 0
csv = CSV.parse(File.read('./test.csv'), headers: false, converters: :numeric)
csv.map{ |row| result += row[0] }

rows = [["result"], [result]]
File.write('./test_ruby.csv', rows.map(&:to_csv).join)
