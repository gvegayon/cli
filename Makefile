all: clean directories compile clean

.PHONY: directories compile clean

directories:
	mkdir dir1; mkdir dir2

compile:
	docker run --rm -i -v ${PWD}:/home/george -w /home/george rocker/tidyverse:4.1.0 Rscript \
		-e 'setwd("sources");sapply(list.files(".", full.names=TRUE, pattern = "*.Rmd"), rmarkdown::render, output_dir = "..")' 
		

clean:
	rm -rf dir1; rm -rf dir2