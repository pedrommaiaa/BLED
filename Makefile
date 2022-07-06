TOP = test_blink
SRC = blink.v
TEST_SRC= test_blink.v
BIN = $(TOP).vvp

$(BIN): $(SRC) $(TEST_SRC)
	iverilog -o $(BIN) -s $(TOP) $(SRC) $(TEST_SRC)

.PHONY: all clean test

all: $(BIN)

build:
	iverilog *.v

test: $(BIN)
	vvp $(BIN)

clean:
	rm -f *.vvp *.vcd *.out
