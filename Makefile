BIN=tennis
CONF=tennis.gpr
BUILD=gprbuild

all:$(BIN)

$(BIN):
	$(BUILD) -P $(CONF) --RTS=./ravenscar-sfp-stm32f4 -XLOADER=RAM
	@mv obj/$(BIN) .

launch:$(BIN)
	sudo ./stlink/st-util&
	arm-eabi-gdb $(BIN)

clean:
	@rm -rf *~ *\#
	@mv $(BIN) obj
	gprclean $(BIN)