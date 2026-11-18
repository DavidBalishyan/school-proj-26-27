SKETCH := MiniTankRobotV2
PROFILE ?= default
BUILD_DIR ?= build
BAUD ?= 9600

DETECTED_PORT := $(shell arduino-cli board list 2>/dev/null | awk '/arduino:avr:uno/ { print $$1; exit }')
PORT ?= $(if $(DETECTED_PORT),$(DETECTED_PORT),/dev/ttyUSB0)

.PHONY: help setup build upload monitor ports clean

help:
	@printf '%s\n' \
	  'Targets:' \
	  '  setup    Install the Arduino AVR core (once)' \
	  '  build    Compile the tank firmware' \
	  '  upload   Compile and upload (remove Bluetooth module first)' \
	  '  monitor  Open the serial monitor at $(BAUD) baud' \
	  '  ports    List connected boards' \
	  '  clean    Remove build artifacts' \
	  '' \
	  'Overrides: make upload PORT=/dev/ttyACM0  BAUD=115200  PROFILE=default'

setup:
	arduino-cli core install arduino:avr

build:
	arduino-cli compile --profile $(PROFILE) --build-path $(BUILD_DIR) $(SKETCH)

upload:
	arduino-cli compile --profile $(PROFILE) --upload --port $(PORT) --build-path $(BUILD_DIR) $(SKETCH)

monitor:
	arduino-cli monitor --port $(PORT) --config baudrate=$(BAUD)

ports:
	arduino-cli board list

clean:
	rm -rf $(BUILD_DIR)
