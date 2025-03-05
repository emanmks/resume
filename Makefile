.PHONY: build clean docker docker-build docker-pdf all help local preview

# Your main LaTeX file name without extension
RESUME = resume

# Default target shows help
.DEFAULT_GOAL := help

# Build the PDF using Docker
build: docker-pdf

# Clean up auxiliary files
clean:
	@echo "Cleaning up auxiliary files..."
	@rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.dvi *.ps

# Clean PDF as well
clean-all: clean
	@echo "Removing PDF files..."
	@rm -f *.pdf

# Build the Docker image
docker-build:
	@echo "Building Docker image..."
	@docker build -t resume-latex .

# Run Docker container to build the PDF
docker-pdf: docker-build
	@echo "Compiling LaTeX with Docker (first pass)..."
	@docker run --rm -v "$(PWD):/var/resume" resume-latex pdflatex -interaction=nonstopmode $(RESUME).tex
	@echo "Compiling LaTeX with Docker (second pass)..."
	@docker run --rm -v "$(PWD):/var/resume" resume-latex pdflatex -interaction=nonstopmode $(RESUME).tex
	@echo "PDF created: $(RESUME).pdf"

# All-in-one command (same as build)
all: build

# Local build (if LaTeX is installed locally)
local:
	@echo "Compiling locally (first pass)..."
	@pdflatex $(RESUME).tex
	@echo "Compiling locally (second pass)..."
	@pdflatex $(RESUME).tex
	@echo "PDF created: $(RESUME).pdf"

# Help target
help:
	@echo "LaTeX Resume Builder"
	@echo "===================="
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "  make build     - Build resume PDF using Docker (default)"
	@echo "  make clean     - Remove auxiliary files but keep PDF"
	@echo "  make clean-all - Remove all generated files including PDF"
	@echo "  make docker-build - Build only the Docker image"
	@echo "  make docker-pdf   - Build PDF using Docker"
	@echo "  make local     - Build PDF locally (requires LaTeX installation)"
	@echo "  make all       - Same as 'build'"
	@echo "  make help      - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make           - Show this help"
	@echo "  make build     - Build the resume PDF using Docker"
	@echo "  make clean all - Clean up and then build the PDF"
	@echo ""
	@echo "Notes:"
	@echo "- This Makefile assumes your main LaTeX file is named '$(RESUME).tex'"
	@echo "- The Docker method requires Docker to be installed and running"