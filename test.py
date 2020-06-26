import csv

result = 0

with open('./test.csv', newline='') as csvfile:
  spamreader = csv.reader(csvfile, delimiter=' ', quotechar="|")
  for row in spamreader:
    result = result + int(row[0][0])

with open('./test_python.csv', 'w', newline='') as csvfile:
  spamwiter = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
  spamwiter.writerow(['result'])
  spamwiter.writerow([result])
