pdf:
	@echo "Generating PDF file from resume.tex ..."
	docker build -t ubuntu-latex .
	docker run --rm -v ${PWD}:/var/resume -it ubuntu-latex sh -c "pdflatex resume.tex"
