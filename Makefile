BUILD_DIR = build
RELEASE_DIR = $(BUILD_DIR)/release

SOURCE_DIR = source
MAIN_SOURCE_DIR = $(SOURCE_DIR)/main

LIBRARY_FILES = $(notdir $(wildcard $(MAIN_SOURCE_DIR)/*))

.PHONY: default release clean

default : release

release : $(LIBRARY_FILES:%=$(RELEASE_DIR)/%)

$(RELEASE_DIR)/% : $(MAIN_SOURCE_DIR)/% | $(RELEASE_DIR)
	cp $< $@

$(RELEASE_DIR) :
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)

