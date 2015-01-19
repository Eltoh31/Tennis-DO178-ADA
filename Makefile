BIN=tennis
CONF=tennis.gpr
BUILD=gprbuild

all:$(BIN)

$(BIN):
	$(BUILD) -P $(CONF) --RTS=./tools/ravenscar-sfp-stm32f4 -XLOADER=RAM
	@mv obj/$(BIN) .

launch:$(BIN)
	echo "target remote:4242" > conf.gdb
	arm-eabi-gdb $(BIN) -x conf.gdb

clean:
	@rm -rf *~ *\#
	@mv $(BIN) obj
	@rm -rf conf.gdb
	@gprclean $(BIN)
