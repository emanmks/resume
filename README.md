# LaTeX Resume Template

A one-column resume for software developers. It uses the base LaTeX templates and fonts to provide ease of use and installation when trying to update the resume. The different sections are clearly documented and custom commands are used to provide consistent formatting. The three main sections in the resume are education, experience, and skills.

## Preview
![Resume Screenshot](/resume_preview.jpg)

## Generate Resume in PDF

### Using Docker (Recommended)

This repository includes a lightweight Docker configuration for generating your resume without installing LaTeX locally.

Prerequisites:
- [Docker](https://docs.docker.com/install/) installed on your system

```sh
# Show available commands
make

# Build the resume PDF
make build

# Clean up auxiliary files but keep PDF
make clean

# Remove all generated files including PDF
make clean-all

# Generate preview image from the PDF
make preview
```

### Using Local LaTeX Installation

If you have LaTeX installed on your system, you can compile directly:

```sh
# Using the Makefile
make local

# Or manually with pdflatex
pdflatex resume.tex
pdflatex resume.tex  # Run twice for proper formatting
```

## Customization

Edit the `resume.tex` file to update your information. The file is structured with clear sections for:
- Personal information
- Experience
- Skills
- Education

## Project Structure

- `resume.tex` - The main LaTeX source file
- `Dockerfile` - Minimal Docker image for LaTeX compilation
- `Makefile` - Automation for building the resume
- `resume_preview.jpg` - Preview image of the resume (auto-generated with `make preview`)

## License
MIT