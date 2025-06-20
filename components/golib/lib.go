package main

import "C"
import (
	"golib/xgo"
)

//export add_numbers
func add_numbers(a, b C.int) C.int {

	x := xgo.Add(int(a), int(b))

	return C.int(x)
}

//export multiply_numbers
func multiply_numbers(a, b C.int) C.int {
	return a * b
}

func main() {}
