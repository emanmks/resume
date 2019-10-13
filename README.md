A one-column resume for software developers. It uses the base latex templates and fonts to provide ease of use and installation when trying to update the resume. The different sections are clearly documented and custom commands are used to provide consistent formatting. The three main sections in the resume are education, experience, and skills.

### Preview
![Resume Screenshot](/resume_preview.jpg)

### Generate resume in PDF using docker

To generate a resume in a PDF format, you will need a docker installed on your local.
Please visit [this link](https://docs.docker.com/install/) if you don't have a docker inside your development environment.

To generate simply type:
```sh
make pdf
```

### Generate resume in PDF using Latex

If you have latex processor in your machine, you can simply use command such as:

```sh
xelatex resume.tex

// Or
pdflatex resume.tex
```

### License
MIT
