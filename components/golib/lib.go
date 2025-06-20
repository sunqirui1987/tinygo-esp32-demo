package main

import "C"

//export add_numbers
func add_numbers(a, b C.int) C.int {
	return a + b
}

//export multiply_numbers
func multiply_numbers(a, b C.int) C.int {
	return a * b
}

func main() {}