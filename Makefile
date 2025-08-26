# Makefile for Academic CV Template
# This file provides convenient commands for building and maintaining the CV

# Variables
MAIN_TEX = academic_cv_template.tex
OUTPUT_PDF = academic_cv_template.pdf
CONFIG_FILE = config.tex
EXAMPLE_CONFIG = examples/config_example.tex

# Default target
.PHONY: all
all: $(OUTPUT_PDF)

# Build the PDF
$(OUTPUT_PDF): $(MAIN_TEX) $(CONFIG_FILE)
	@echo "🔨 Compiling LaTeX document..."
	pdflatex -interaction=nonstopmode $(MAIN_TEX)
	pdflatex -interaction=nonstopmode $(MAIN_TEX)
	@echo "✅ PDF compiled successfully!"

# Build with verbose output
.PHONY: build-verbose
build-verbose: $(MAIN_TEX) $(CONFIG_FILE)
	@echo "🔨 Compiling LaTeX document (verbose)..."
	pdflatex $(MAIN_TEX)
	pdflatex $(MAIN_TEX)

# Quick build (single pass)
.PHONY: quick
quick: $(MAIN_TEX) $(CONFIG_FILE)
	@echo "⚡ Quick build (single pass)..."
	pdflatex -interaction=nonstopmode $(MAIN_TEX)

# Setup config file from example
.PHONY: setup
setup:
	@if [ ! -f $(CONFIG_FILE) ]; then \
		echo "📝 Creating config.tex from example..."; \
		cp $(EXAMPLE_CONFIG) $(CONFIG_FILE); \
		echo "✅ Config file created! Please edit config.tex with your information."; \
	else \
		echo "⚠️  Config file already exists. Use 'make reset-config' to overwrite."; \
	fi

# Reset config file
.PHONY: reset-config
reset-config:
	@echo "🔄 Resetting config.tex from example..."
	cp $(EXAMPLE_CONFIG) $(CONFIG_FILE)
	@echo "✅ Config file reset!"

# Clean auxiliary files
.PHONY: clean
clean:
	@echo "🧹 Cleaning auxiliary files..."
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz
	@echo "✅ Auxiliary files cleaned!"

# Clean all generated files including PDF
.PHONY: clean-all
clean-all: clean
	@echo "🧹 Cleaning all generated files..."
	rm -f $(OUTPUT_PDF)
	@echo "✅ All generated files cleaned!"

# Watch for changes and rebuild automatically (requires inotify-tools on Linux)
.PHONY: watch
watch:
	@echo "👀 Watching for changes..."
	@command -v inotifywait >/dev/null 2>&1 || { echo "❌ inotifywait not found. Install inotify-tools."; exit 1; }
	@while inotifywait -e modify $(MAIN_TEX) $(CONFIG_FILE); do make quick; done

# Install required packages (Ubuntu/Debian)
.PHONY: install-deps-ubuntu
install-deps-ubuntu:
	@echo "📦 Installing LaTeX dependencies (Ubuntu/Debian)..."
	sudo apt-get update
	sudo apt-get install -y texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra

# Install required packages (macOS with Homebrew)
.PHONY: install-deps-macos
install-deps-macos:
	@echo "📦 Installing LaTeX dependencies (macOS)..."
	brew install --cask mactex

# Check if all required files exist
.PHONY: check
check:
	@echo "🔍 Checking required files..."
	@if [ ! -f $(MAIN_TEX) ]; then echo "❌ Main template file missing: $(MAIN_TEX)"; exit 1; fi
	@if [ ! -f $(CONFIG_FILE) ]; then echo "❌ Config file missing: $(CONFIG_FILE). Run 'make setup' first."; exit 1; fi
	@if [ ! -d assets ]; then echo "⚠️  Assets directory missing. Create it and add your images."; fi
	@echo "✅ All required files present!"

# Open the PDF (macOS)
.PHONY: open-mac
open-mac: $(OUTPUT_PDF)
	open $(OUTPUT_PDF)

# Open the PDF (Linux)
.PHONY: open-linux
open-linux: $(OUTPUT_PDF)
	xdg-open $(OUTPUT_PDF)

# Show help
.PHONY: help
help:
	@echo "Academic CV Template - Available Commands:"
	@echo ""
	@echo "Building:"
	@echo "  make              - Build the PDF (default)"
	@echo "  make quick        - Quick build (single LaTeX pass)"
	@echo "  make build-verbose - Build with verbose output"
	@echo ""
	@echo "Setup:"
	@echo "  make setup        - Create config.tex from example"
	@echo "  make reset-config - Reset config.tex to example"
	@echo "  make check        - Check if required files exist"
	@echo ""
	@echo "Maintenance:"
	@echo "  make clean        - Remove auxiliary files"
	@echo "  make clean-all    - Remove all generated files"
	@echo "  make watch        - Watch for changes and rebuild"
	@echo ""
	@echo "System Setup:"
	@echo "  make install-deps-ubuntu - Install LaTeX on Ubuntu/Debian"
	@echo "  make install-deps-macos  - Install LaTeX on macOS"
	@echo ""
	@echo "Viewing:"
	@echo "  make open-mac     - Open PDF on macOS"
	@echo "  make open-linux   - Open PDF on Linux"
	@echo ""
	@echo "Help:"
	@echo "  make help         - Show this help message"

# Ensure config file exists before building
$(CONFIG_FILE):
	@echo "❌ Config file missing. Run 'make setup' first."
	@exit 1
