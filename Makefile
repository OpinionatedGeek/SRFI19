TARGET = srfi-19-0.1.tgz

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
	snow-chibi package --version=0.1 \
		--authors="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--maintainers="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--license=mit --doc=srfi-19.html \
		--test=run-tests.scm srfi-19.sld
