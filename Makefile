TARGET = srfi-19-1.0.tgz

default: package

all: package

clean:
	rm -f $(TARGET)

test:
	chibi-scheme run-tests.scm

package: $(TARGET)

install: package
	snow-chibi install $(TARGET)

upload: package
	snow-chibi upload $(TARGET)

$(TARGET): *.scm *.sld *.html
	snow-chibi package --version=1.0 \
		--authors="Will Fitzgerald" \
		--maintainers="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--description="Implementation of SRFI 19 'Time Data Types and Procedures'" \
		--license=mit --doc=srfi-19.html \
		--test=run-tests.scm srfi-19.sld
