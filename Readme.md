# Chibi port of SRFI19

A port of the standard implementation, for [Chibi Scheme](http://synthcode.com/wiki/chibi-scheme).

## Usage

All of SRFI19 should work. There are tests to cover the important bits.

## Problems?

If you find a problem, pull requests with failing tests or - even better! - fixes are greatly appreciated.

## Thanks

The [standard implementation](https://srfi.schemers.org/srfi-19/srfi-19.scm) of SRFI19 was taken from the link in [SRFI19](https://srfi.schemers.org/srfi-19/srfi-19.html). Many thanks to Will Fitzgerald, the author of SRFI19, for providing that.

## This Implementation

The implementation file - srfi19.scm - is now wrapped in a Scheme library definition in the srfi19.sld file.

I've added a `cond-expand` at the top of the implementation file, added Chibi-specific code there, and moved some of the standard implementation into the `else` block of that `cond-expand`. Other scheme implementations should be able to add their own implementation code to the same `cond-expand`.

I've also ported the tests to `(chibi test)` so they can be run automatically on installation to verify everything is OK. I've added some more tests too.

I've made a couple of reluctant alterations to the standard SRFI implementation.
* I replaced the one use of the eof symbol in `(eq? line eof)` with the R7RS standard `(eof-object? line)`. `eof-object?` was used in other places so it appears this one use was overlooked.
* There's a bug in `(copy-item)`, where the standard implementation passed the arguments in the wrong order to `(make-time)` - it was calling `(make-time type seconds nanoseconds)` instead of `(make-time type nanoseconds seconds)`.

I've added two new format directives that I'd really rather were better supported everywhere.
* `~g` - day of month. It just outputs the day of the month (1...31). The other two standard directives both specify either blank padding or zero padding but there's no option for no padding.
* `~u` - day ordinal suffix. Outputs the locale-specific suffix for the day of the month. For example "rd" for 3, "th" for 6, or "st" for 21. This allows you to format dates as "Sunday, 1st of January 2017". It's possible to insert the "st" in such a format string manually but it doesn't seem a clean approach.