;; SRFI-19: Time Data Types and Procedures.
;;
;; Original work Copyright (C) I/NET, Inc. (2000, 2002, 2003). All Rights Reserved.
;; Modified work Copyright (C) 2017 Geoff Taylor.
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;> Chibi Scheme implementation of
;;> \hyperlink["https://srfi.schemers.org/srfi-19/srfi-19.html"]{SRFI 19}
;;> based on the wibble
;;> \hyperlink["https://srfi.schemers.org/srfi-19/srfi-19.scm"]{standard implementation}.

(define-library
  (srfi 19)
  (export time-duration time-monotonic time-process time-tai time-thread time-utc
          current-date current-julian-day current-modified-julian-day current-time time-resolution
          make-time time? time-type time-nanosecond time-second set-time-type!
          set-time-nanosecond! set-time-second! copy-time
          time<=? time<? time=? time>=? time>?
          time-difference time-difference! add-duration add-duration! subtract-duration subtract-duration!
          make-date date? date-nanosecond date-second date-minute date-hour date-day
          date-month date-year date-zone-offset date-year-day date-week-day date-week-number
          date->julian-day date->modified-julian-day date->time-monotonic date->time-tai date->time-utc
          julian-day->date julian-day->time-monotonic julian-day->time-tai julian-day->time-utc
          modified-julian-day->date modified-julian-day->time-monotonic modified-julian-day->time-tai
          modified-julian-day->time-utc
          time-monotonic->date time-monotonic->julian-day time-monotonic->modified-julian-day
          time-monotonic->time-tai time-monotonic->time-tai! time-monotonic->time-utc time-monotonic->time-utc!
          time-tai->date time-tai->julian-day time-tai->modified-julian-day time-tai->time-monotonic
          time-tai->time-monotonic! time-tai->time-utc time-tai->time-utc! time-utc->date
          time-utc->julian-day time-utc->modified-julian-day time-utc->time-monotonic time-utc->time-monotonic!
          time-utc->time-tai time-utc->time-tai! date->string string->date
  )
  (import (scheme small))
  (cond-expand
   (chibi
    (import (chibi) (prefix (chibi time) chibi:)))
   (else #f))
  (include "srfi-19.scm"))
