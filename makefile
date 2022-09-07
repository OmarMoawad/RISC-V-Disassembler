VPATH= src
INC_DIR= ./headers
SRC_DIR=./src
CC= g++
CFLAGS= -c -I$(INC_DIR)
objects= RV32C.o RV32I.o disassembler.o RVDecoder.o rvcdiss.o

rvcdiss2: $(objects)
	$(CC) $(objects) -o rvcdiss 
RV32C.o: $(INC_DIR)/RV32C.h $(SRC_DIR)/RV32C.cpp
	$(CC) $(SRC_DIR)/RV32C.cpp $(CFLAGS) -o RV32C.o
RV32I.o: $(INC_DIR)/RV32I.h $(SRC_DIR)/RV32I.cpp
	$(CC) $(SRC_DIR)/RV32I.cpp $(CFLAGS) -o RV32I.o
disassembler.o: $(INC_DIR)/disassembler.h $(SRC_DIR)/disassembler.cpp
	$(CC) $(SRC_DIR)/disassembler.cpp $(CFLAGS) -o disassembler.o
RVDecoder.o: $(INC_DIR)/RVDecoder.h $(SRC_DIR)/RVDecoder.cpp $(INC_DIR)/utils.h $(INC_DIR)/common.h
	$(CC) $(SRC_DIR)/RVDecoder.cpp $(CFLAGS) -o RVDecoder.o
rvcdiss.o: $(INC_DIR)/disassembler.h $(SRC_DIR)/rvcdiss.cpp $(INC_DIR)/utils.h
	$(CC) $(SRC_DIR)/rvcdiss.cpp $(CFLAGS) -o rvcdiss.o
clean:
	rm $(objects)