SERVICE_NAME = calculator
VERSION = 1.0.0
BUILD_DIR = build
DEB_DIR = debian
PKG_NAME = $(SERVICE_NAME)_$(VERSION)_all.deb
INSTALL_DIR = /usr/local/bin

PYTHON_SCRIPT = calculator.py
TEST_SCRIPT = test_calculator.py

.PHONY: all build test lint package clean

# Default target
all: build test lint package

# Build step
build:
	@echo "Building $(SERVICE_NAME)"
	@mkdir -p $(BUILD_DIR)

# Run tests
test:
	@echo "Running tests"
	@pytest $(TEST_SCRIPT)

# Run linter
lint:
	@echo "Linting"
	@pylint $(PYTHON_SCRIPT)

# Package as a Debian package
package:
	@echo "Packaging as .deb"
	@mkdir -p $(DEB_DIR)/DEBIAN
	@mkdir -p $(DEB_DIR)$(INSTALL_DIR)
	@cp $(PYTHON_SCRIPT) $(DEB_DIR)$(INSTALL_DIR)/
	@echo "Package: $(SERVICE_NAME)" > $(DEB_DIR)/DEBIAN/control
	@echo "Version: $(VERSION)" >> $(DEB_DIR)/DEBIAN/control
	@echo "Architecture: all" >> $(DEB_DIR)/DEBIAN/control
	@echo "Maintainer: Harrison McLain" >> $(DEB_DIR)/DEBIAN/control
	@echo "Description: Simple calculator application" >> $(DEB_DIR)/DEBIAN/control
	@dpkg-deb --build $(DEB_DIR) $(PKG_NAME)
	@echo "Package created: $(PKG_NAME)"

# Clean up
clean:
	@echo "Cleaning"
	@rm -rf $(BUILD_DIR) $(DEB_DIR) $(PKG_NAME)
