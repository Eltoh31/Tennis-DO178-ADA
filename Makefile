BIN=tennis
CONF=tennis.gpr
BUILD=gprbuild

all:$(BIN)

$(BIN):
	$(BUILD) -P $(CONF) --RTS=./tools/ravenscar-sfp-stm32f4 -XLOADER=RAM


launch:$(BIN)
	echo "target remote:4242" > conf.gdb
	arm-eabi-gdb obj/$(BIN) -x conf.gdb

clean:
	@rm -rf *~ *\#
	@cd src && rm -rf *~ *\#
	@rm -rf conf.gdb
	@gprclean $(BIN)
