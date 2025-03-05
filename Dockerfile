FROM debian:bullseye-slim

# Install necessary LaTeX packages for the resume and image conversion tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    make \
    imagemagick \
    poppler-utils \
    ghostscript \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/resume
WORKDIR /var/resume

# Default command to compile LaTeX documents
CMD ["pdflatex", "-interaction=nonstopmode"]