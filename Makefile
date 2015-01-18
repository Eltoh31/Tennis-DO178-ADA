BIN=tennis
CONF=tennis.gpr
BUILD=gprbuild

all:$(BIN)

$(BIN):
	$(BUILD) -P $(CONF) --RTS=./ravenscar-sfp-stm32f4 -XLOADER=RAM
	@mv obj/$(BIN) .

launch:$(BIN)
	sudo ./stlink/st-util&
	echo -e "target remote:4242 \n load" > conf.gdb
	arm-eabi-gdb $(BIN) -x conf.gdb
	rm conf.gdb

clean:
	@rm -rf *~ *\#
	@mv $(BIN) obj
	gprclean $(BIN)
