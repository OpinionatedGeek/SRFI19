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

$(TARGET): *.scm *.sld
	snow-chibi package --version=0.1 \
		--authors="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--maintainers="Geoff Taylor <srfi-19@opinionatedgeek.com>" \
		--license=mit --doc-from-scribble \
		--description="A port of the standard SRFI-19 implementation to Chibi Scheme." \
		--test=run-tests.scm srfi-19.sld
