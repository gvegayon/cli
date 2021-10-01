all: clean directories compile clean

.PHONY: directories compile clean

directories:
	mkdir dir1; mkdir dir2

compile:
	docker run --rm -i -v ${PWD}:/home/george -w /home/george rocker/tidyverse:4.1.0 Rscript \
		--vanilla make.R
		

clean:
	rm -rf dir1; rm -rf dir2
