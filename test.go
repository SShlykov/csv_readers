package main

import (
    "encoding/csv"
    "log"
		"os"
		"strconv"
)

func readCsvFile(filePath string) [][]string {
		f, err := os.Open(filePath)
		checkError("Unable to read input file " + filePath, err)
    defer f.Close()

    csvReader := csv.NewReader(f)
		records, err := csvReader.ReadAll()
		checkError("Unable to parse file as CSV for " + filePath, err)

    return records
	}

	func writeCsvFile(filePath string, csv_data [][]string) {
		f, err := os.Create("test_go.csv")
		checkError("Cannot create file " + filePath, err)
		defer f.Close()

		writer := csv.NewWriter(f)
		defer writer.Flush()

		for _,value := range csv_data {
			err := writer.Write(value)
			checkError("Cannot write to file", err)
		}
}

func checkError(message string, err error) {
	if err != nil {
			log.Fatal(message, err)
	}
}

func main() {
		records := readCsvFile("./test.csv")
		result := 0

		for i := 0; i < len(records); i++ {
			num, err := strconv.Atoi(records[i][0])
			if err == nil {
				result += num
			}
		}

		csv_data := [][]string{{"result"},{strconv.Itoa(result)}}

    writeCsvFile("./test_go.csv", csv_data)
}
