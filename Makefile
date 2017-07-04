TARGET = srfi-19-0.2.tgz

default: package

all: package

clean:
	rm -f $(TARGET)

install: $(TARGET)
	snow-chibi install $(TARGET)

test:
	chibi-scheme run-tests.scm

package: $(TARGET)

$(TARGET): *.scm *.sld *.html
	snow-chibi package --version=0.2 \
		--authors="Will Fitzgerald" \
		--maintainers="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--description="Implementation of SRFI 19 'Time Data Types and Procedures'" \
		--license=mit --doc=srfi-19.html \
		--test=run-tests.scm srfi-19.sld
