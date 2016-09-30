# Makefile to build the sib engine
CC		:= gcc
CXX		:= g++

CFLAGS 	:= -Wall -g 
LDFLAGS := 

INC := -Iinclude
LIB := 

OUTPUT	:= $(shell pwd)
TARGET	:= $(shell basename $(OUTPUT))

SOURCES	:= \
	src/*.c

OBJECTS := $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')
OBJECTS := $(addprefix build/, $(OBJECTS))

define template 
build/$(1)%.o:$(1)%.c
	@echo CXX $$^
	@mkdir -p $$(dir $$@)
	@$$(CXX) -c -o $$@ $$(CFLAGS) $$^ $$(INC)
endef

$(foreach prog,$(dir $(SOURCES)),$(eval $(call template,$(prog))))

all: build $(TARGET) run

build:
	@echo building...
	@mkdir -p build


$(TARGET): $(OBJECTS)
	@echo LD $(shell echo $(OBJECTS) | sed -e 's,build/,,g')
	@$(CC) -o $@ $(LDFLAGS) $(LIB) $^
	
run:
	@echo ====== run $(TARGET) ======
	@./$(TARGET)

clean:
	@echo clean...
	@-rm build $(TARGET) -rf 
