BIN=base
CONF=tennis.gpr
BUILD=gprbuild

all:$(BIN)

$(BIN):
	$(BUILD) -P $(CONF) --RTS=./ravenscar-sfp-stm32f4 -XLOADER=RAM

clean:
	gprclean $(BIN)