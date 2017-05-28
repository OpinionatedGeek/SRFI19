;; Problems to investigate:
;;
;; There's a problem with ~f - standard implementation which sometimes throws an error
;; saying:
;;   "invalid type, expected Number: #f"
;;
;; (date->string (make-date 9 10 11 14 1 2 2017 0) "~f")
;; Problem seems to be (number->string) returns 9e-09 but the standard implementation
;; expects a formatted number with a decimal point.

(import (scheme small) (chibi test))

(load "srfi-19.scm")

(test-begin "SRFI 19")


(test-group
 "[Existence Check] Constants"
 (test "Constant time-tai must exist" time-tai time-tai)
 (test "Constant time-utc must exist" time-utc time-utc)
 (test "Constant time-monotonic must exist" time-monotonic time-monotonic)
 (test "Constant time-thread must exist" time-thread time-thread)
 (test "Constant time-process must exist" time-process time-process)
 (test "Constant time-duration must exist" time-duration time-duration))


(test-group
 "[Existence Check] Clock Procedures"
 (test-assert "Procedure current-date must exist" (procedure? current-date))
 (test-assert "Procedure current-julian-day must exist" (procedure? current-julian-day))
 (test-assert "Procedure current-modified-julian-day must exist" (procedure? current-modified-julian-day))
 (test-assert "Procedure current-time must exist" (procedure? current-time))
 (test-assert "Procedure time-resolution must exist" (procedure? time-resolution)))


(test-group
 "[Existence Check] Time object and accessors"
 (test-assert "Procedure make-time must exist" (procedure? make-time))
 (test-assert "Procedure time? must exist" (procedure? time?))
 (test-assert "Procedure time-type must exist" (procedure? time-type))
 (test-assert "Procedure time-nanosecond must exist" (procedure? time-nanosecond))
 (test-assert "Procedure time-second must exist" (procedure? time-second))
 (test-assert "Procedure set-time-type! must exist" (procedure? set-time-type!))
 (test-assert "Procedure set-time-nanosecond! must exist" (procedure? set-time-nanosecond!))
 (test-assert "Procedure set-time-second! must exist" (procedure? set-time-second!))
 (test-assert "Procedure copy-time must exist" (procedure? copy-time)))


(test-group
 "[Existence Check] Time comparison procedures"
 (test-assert "Procedure time<=? must exist" (procedure? time<=?))
 (test-assert "Procedure time<? must exist" (procedure? time<?))
 (test-assert "Procedure time=? must exist" (procedure? time=?))
 (test-assert "Procedure time>=? must exist" (procedure? time>=?))
 (test-assert "Procedure time>? must exist" (procedure? time>?)))


(test-group
 "[Existence Check] Time arithmetic procedures"
 (test-assert "Procedure time-difference must exist" (procedure? time-difference))
 (test-assert "Procedure time-difference! must exist" (procedure? time-difference!))
 (test-assert "Procedure add-duration must exist" (procedure? add-duration))
 (test-assert "Procedure add-duration! must exist" (procedure? add-duration!))
 (test-assert "Procedure subtract-duration must exist" (procedure? subtract-duration))
 (test-assert "Procedure subtract-duration! must exist" (procedure? subtract-duration!)))


(test-group
 "[Existence Check] Date object and accessors"
 (test-assert "Procedure make-date must exist" (procedure? make-date))
 (test-assert "Procedure date? must exist" (procedure? date?))
 (test-assert "Procedure date-nanosecond must exist" (procedure? date-nanosecond))
 (test-assert "Procedure date-second must exist" (procedure? date-second))
 (test-assert "Procedure date-minute must exist" (procedure? date-minute))
 (test-assert "Procedure date-hour must exist" (procedure? date-hour))
 (test-assert "Procedure date-day must exist" (procedure? date-day))
 (test-assert "Procedure date-month must exist" (procedure? date-month))
 (test-assert "Procedure date-year must exist" (procedure? date-year))
 (test-assert "Procedure date-zone-offset must exist" (procedure? date-zone-offset))
 (test-assert "Procedure date-year-day must exist" (procedure? date-year-day))
 (test-assert "Procedure date-week-day must exist" (procedure? date-week-day))
 (test-assert "Procedure date-week-number must exist" (procedure? date-week-number)))


(test-group
 "[Existence Check] Time/Date/Julian Day/Modified Julian Day Converters"
 (test-assert "Procedure date->julian-day must exist" (procedure? date->julian-day))
 (test-assert "Procedure date->modified-julian-day must exist" (procedure? date->modified-julian-day))
 (test-assert "Procedure date->time-monotonic must exist" (procedure? date->time-monotonic))
 (test-assert "Procedure date->time-tai must exist" (procedure? date->time-tai))
 (test-assert "Procedure date->time-utc must exist" (procedure? date->time-utc))
 (test-assert "Procedure julian-day->date must exist" (procedure? julian-day->date))
 (test-assert "Procedure julian-day->time-monotonic must exist" (procedure? julian-day->time-monotonic))
 (test-assert "Procedure julian-day->time-tai must exist" (procedure? julian-day->time-tai))
 (test-assert "Procedure julian-day->time-utc must exist" (procedure? julian-day->time-utc))
 (test-assert "Procedure modified-julian-day->date must exist" (procedure? modified-julian-day->date))
 (test-assert "Procedure modified-julian-day->time-monotonic must exist" (procedure? modified-julian-day->time-monotonic))
 (test-assert "Procedure modified-julian-day->time-tai must exist" (procedure? modified-julian-day->time-tai))
 (test-assert "Procedure modified-julian-day->time-utc must exist" (procedure? modified-julian-day->time-utc))
 (test-assert "Procedure time-monotonic->date must exist" (procedure? time-monotonic->date))
 (test-assert "Procedure time-monotonic->julian-day must exist" (procedure? time-monotonic->julian-day))
 (test-assert "Procedure time-monotonic->modified-julian-day must exist" (procedure? time-monotonic->modified-julian-day))
 (test-assert "Procedure time-monotonic->time-tai must exist" (procedure? time-monotonic->time-tai))
 (test-assert "Procedure time-monotonic->time-tai! must exist" (procedure? time-monotonic->time-tai!))
 (test-assert "Procedure time-monotonic->time-utc must exist" (procedure? time-monotonic->time-utc))
 (test-assert "Procedure time-monotonic->time-utc! must exist" (procedure? time-monotonic->time-utc!))
 (test-assert "Procedure time-tai->date must exist" (procedure? time-tai->date))
 (test-assert "Procedure time-tai->julian-day must exist" (procedure? time-tai->julian-day))
 (test-assert "Procedure time-tai->modified-julian-day must exist" (procedure? time-tai->modified-julian-day))
 (test-assert "Procedure time-tai->time-monotonic must exist" (procedure? time-tai->time-monotonic))
 (test-assert "Procedure time-tai->time-monotonic! must exist" (procedure? time-tai->time-monotonic!))
 (test-assert "Procedure time-tai->time-utc must exist" (procedure? time-tai->time-utc))
 (test-assert "Procedure time-tai->time-utc! must exist" (procedure? time-tai->time-utc!))
 (test-assert "Procedure time-utc->date must exist" (procedure? time-utc->date))
 (test-assert "Procedure time-utc->julian-day must exist" (procedure? time-utc->julian-day))
 (test-assert "Procedure time-utc->modified-julian-day must exist" (procedure? time-utc->modified-julian-day))
 (test-assert "Procedure time-utc->time-monotonic must exist" (procedure? time-utc->time-monotonic))
 (test-assert "Procedure time-utc->time-monotonic! must exist" (procedure? time-utc->time-monotonic!))
 (test-assert "Procedure time-utc->time-tai must exist" (procedure? time-utc->time-tai))
 (test-assert "Procedure time-utc->time-tai! must exist" (procedure? time-utc->time-tai!)))


(test-group
 "[Existence Check] Date to String/String to Date Converters"
 (test-assert "Procedure date->string must exist" (procedure? date->string))
 (test-assert "Procedure string->date must exist" (procedure? string->date)))


(test-group
 "[SRFI Tests] Creating time structures"
 (test-assert "(current-time) must return a value"
   (not (null? (current-time))))
 (test-assert "(current-time 'time-tai) must return a value"
   (not (null? (current-time 'time-tai))))
 (test-assert "(current-time 'time-utc) must return a value"
   (not (null? (current-time 'time-utc))))
 (test-assert "(current-time 'time-monotonic) must return a value"
   (not (null? (current-time 'time-monotonic))))
 (test-assert "(current-time 'time-thread) must return a value"
   (not (null? (current-time 'time-thread))))
 (test-assert "(current-time 'time-process) must return a value"
   (not (null? (current-time 'time-process)))))


(test-group
 "[SRFI Tests] Testing time resolutions"
 (test-assert "(time-resolution 'time-tai) must return a value"
   (not (null? (time-resolution 'time-tai))))
 (test-assert "(time-resolution 'time-utc) must return a value"
   (not (null? (time-resolution 'time-utc))))
 (test-assert "(time-resolution 'time-monotonic) must return a value"
   (not (null? (time-resolution 'time-monotonic))))
 (test-assert "(time-resolution 'time-thread) must return a value"
   (not (null? (time-resolution 'time-thread))))
 (test-assert "(time-resolution 'time-process) must return a value"
   (not (null? (time-resolution 'time-process)))))


(test-group
 "[SRFI Tests] Time comparisons (time=?, etc.)"
 (let ((t1 (make-time 'time-utc 0 1))
       (t2 (make-time 'time-utc 0 1))
       (t3 (make-time 'time-utc 0 2))
       (t11 (make-time 'time-utc 1001 1))
       (t12 (make-time 'time-utc 1001 1))
       (t13 (make-time 'time-utc 1001 2)))
   (test-assert "(time=? t1 t2) comparison" (time=? t1 t2))
   (test-assert "(time>? t3 t2) comparison" (time>? t3 t2))
   (test-assert "(time<? t2 t3) comparison" (time<? t2 t3))
   (test-assert "(time>=? t1 t2) comparison" (time>=? t1 t2))
   (test-assert "(time>=? t3 t2) comparison" (time>=? t3 t2))
   (test-assert "(time<=? t1 t2) comparison" (time<=? t1 t2))
   (test-assert "(time<=? t2 t3) comparison" (time<=? t2 t3))
   (test-assert "(time=? t11 t12) comparison" (time=? t11 t12))
   (test-assert "(time>? t13 t12) comparison" (time>? t13 t12))
   (test-assert "(time<? t12 t13) comparison" (time<? t12 t13))
   (test-assert "(time>=? t11 t12) comparison" (time>=? t11 t12))
   (test-assert "(time>=? t13 t12) comparison" (time>=? t13 t12))
   (test-assert "(time<=? t11 t12) comparison" (time<=? t11 t12))
   (test-assert "(time<=? t12 t13) comparison" (time<=? t12 t13))))


(test-group
 "[SRFI Tests] Time difference"
 (let ((t1 (make-time 'time-utc 0 3000))
       (t2 (make-time 'time-utc 0 1000))
       (t3 (make-time 'time-duration 0 2000))
       (t4 (make-time 'time-duration 0 -2000)))
   (test-assert "(time=? t3 (time-difference t1 t2)) difference"
     (time=? t3 (time-difference t1 t2)))
   (test-assert "(time=? t4 (time-difference t2 t1)) difference"
     (time=? t4 (time-difference t2 t1)))))


(define (test-one-utc-tai-edge utc tai-diff tai-last-diff)
  (let* (;; right on the edge they should be the same
	 (utc-basic (make-time 'time-utc 0 utc))
	 (tai-basic (make-time 'time-tai 0 (+ utc tai-diff)))
	 (utc->tai-basic (time-utc->time-tai utc-basic))
	 (tai->utc-basic (time-tai->time-utc tai-basic))
	 ;; a second before they should be the old diff
	 (utc-basic-1 (make-time 'time-utc 0 (- utc 1)))
	 (tai-basic-1 (make-time 'time-tai 0 (- (+ utc tai-last-diff) 1)))
	 (utc->tai-basic-1 (time-utc->time-tai utc-basic-1))
	 (tai->utc-basic-1 (time-tai->time-utc tai-basic-1))
	 ;; a second later they should be the new diff
	 (utc-basic+1 (make-time 'time-utc 0 (+ utc 1)))
	 (tai-basic+1 (make-time 'time-tai 0 (+ (+ utc tai-diff) 1)))
	 (utc->tai-basic+1 (time-utc->time-tai utc-basic+1))
	 (tai->utc-basic+1 (time-tai->time-utc tai-basic+1))
	 ;; ok, let's move the clock half a month or so plus half a second
	 (shy (* 15 24 60 60))
	 (hs (/ (expt 10 9) 2))
	 ;; a second later they should be the new diff
	 (utc-basic+2 (make-time 'time-utc hs (+ utc shy)))
	 (tai-basic+2 (make-time 'time-tai hs (+ (+ utc tai-diff) shy)))
	 (utc->tai-basic+2 (time-utc->time-tai utc-basic+2))
	 (tai->utc-basic+2 (time-tai->time-utc tai-basic+2)))
    (and (time=? utc-basic tai->utc-basic)
	 (time=? tai-basic utc->tai-basic)
	 (time=? utc-basic-1 tai->utc-basic-1)
	 (time=? tai-basic-1 utc->tai-basic-1)
	 (time=? utc-basic+1 tai->utc-basic+1)
	 (time=? tai-basic+1 utc->tai-basic+1)
	 (time=? utc-basic+2 tai->utc-basic+2)
	 (time=? tai-basic+2 utc->tai-basic+2))))


(test-group
 "[SRFI Tests] TAI-UTC Conversions"
 (test-assert "(test-one-utc-tai-edge 915148800  32 31) should pass all checks"
   (test-one-utc-tai-edge 915148800  32 31))
 (test-assert "(test-one-utc-tai-edge 867715200  31 30) should pass all checks"
   (test-one-utc-tai-edge 867715200  31 30))
 (test-assert "(test-one-utc-tai-edge 820454400  30 29) should pass all checks"
   (test-one-utc-tai-edge 820454400  30 29))
 (test-assert "(test-one-utc-tai-edge 773020800  29 28) should pass all checks"
   (test-one-utc-tai-edge 773020800  29 28))
 (test-assert "(test-one-utc-tai-edge 741484800  28 27) should pass all checks"
   (test-one-utc-tai-edge 741484800  28 27))
 (test-assert "(test-one-utc-tai-edge 709948800  27 26) should pass all checks"
   (test-one-utc-tai-edge 709948800  27 26))
 (test-assert "(test-one-utc-tai-edge 662688000  26 25) should pass all checks"
   (test-one-utc-tai-edge 662688000  26 25))
 (test-assert "(test-one-utc-tai-edge 631152000  25 24) should pass all checks"
   (test-one-utc-tai-edge 631152000  25 24))
 (test-assert "(test-one-utc-tai-edge 567993600  24 23) should pass all checks"
   (test-one-utc-tai-edge 567993600  24 23))
 (test-assert "(test-one-utc-tai-edge 489024000  23 22) should pass all checks"
   (test-one-utc-tai-edge 489024000  23 22))
 (test-assert "(test-one-utc-tai-edge 425865600  22 21) should pass all checks"
   (test-one-utc-tai-edge 425865600  22 21))
 (test-assert "(test-one-utc-tai-edge 394329600  21 20) should pass all checks"
   (test-one-utc-tai-edge 394329600  21 20))
 (test-assert "(test-one-utc-tai-edge 362793600  20 19) should pass all checks"
   (test-one-utc-tai-edge 362793600  20 19))
 (test-assert "(test-one-utc-tai-edge 315532800  19 18) should pass all checks"
   (test-one-utc-tai-edge 315532800  19 18))
 (test-assert "(test-one-utc-tai-edge 283996800  18 17) should pass all checks"
   (test-one-utc-tai-edge 283996800  18 17))
 (test-assert "(test-one-utc-tai-edge 252460800  17 16) should pass all checks"
   (test-one-utc-tai-edge 252460800  17 16))
 (test-assert "(test-one-utc-tai-edge 220924800  16 15) should pass all checks"
   (test-one-utc-tai-edge 220924800  16 15))
 (test-assert "(test-one-utc-tai-edge 189302400  15 14) should pass all checks"
   (test-one-utc-tai-edge 189302400  15 14))
 (test-assert "(test-one-utc-tai-edge 157766400  14 13) should pass all checks"
   (test-one-utc-tai-edge 157766400  14 13))
 (test-assert "(test-one-utc-tai-edge 126230400  13 12) should pass all checks"
   (test-one-utc-tai-edge 126230400  13 12))
 (test-assert "(test-one-utc-tai-edge 94694400   12 11) should pass all checks"
   (test-one-utc-tai-edge 94694400   12 11))
 (test-assert "(test-one-utc-tai-edge 78796800   11 10) should pass all checks"
   (test-one-utc-tai-edge 78796800   11 10))
 (test-assert "(test-one-utc-tai-edge 63072000   10 0) should pass all checks"
   (test-one-utc-tai-edge 63072000   10 0))
 (test-assert "(test-one-utc-tai-edge 0   0 0) should pass all checks"
   (test-one-utc-tai-edge 0   0 0)) ;; at the epoch
 (test-assert "(test-one-utc-tai-edge 10   0 0) should pass all checks"
   (test-one-utc-tai-edge 10   0 0)) ;; close to it ...
 (test-assert "(test-one-utc-tai-edge 1045789645 32 32) should pass all checks"
   (test-one-utc-tai-edge 1045789645 32 32)) ;; about now ...
 )


(define (tm:date= d1 d2)
  (and (= (date-year d1) (date-year d2))
       (= (date-month d1) (date-month d2))
       (= (date-day d1) (date-day d2))
       (= (date-hour d1) (date-hour d2))
       (= (date-second d1) (date-second d2))
       (= (date-nanosecond d1) (date-nanosecond d2))
       (= (date-zone-offset d1) (date-zone-offset d2))))


(test-group
 "[SRFI Tests] TAI-Date Conversions"
 (test-assert "time-tai->date conversion test 1"
   (tm:date= (time-tai->date (make-time time-tai 0 (+ 915148800 29)) 0)
             (make-date 0 58 59 23 31 12 1998 0)))
 (test-assert "time-tai->date conversion test 2"
   (tm:date= (time-tai->date (make-time time-tai 0 (+ 915148800 30)) 0)
             (make-date 0 59 59 23 31 12 1998 0)))
 (test-assert "time-tai->date conversion test 3"
   (tm:date= (time-tai->date (make-time time-tai 0 (+ 915148800 31)) 0)
             (make-date 0 60 59 23 31 12 1998 0)))
 (test-assert "time-tai->date conversion test 4"
   (tm:date= (time-tai->date (make-time time-tai 0 (+ 915148800 32)) 0)
             (make-date 0 0 0 0 1 1 1999 0))))


(test-group
 "[SRFI Tests] Date-UTC Conversions"
 (test-assert "date->time-utc conversion test 1"
   (time=? (make-time time-utc 0 (- 915148800 2))
           (date->time-utc (make-date 0 58 59 23 31 12 1998 0))))
 (test-assert "date->time-utc conversion test 2"
   (time=? (make-time time-utc 0 (- 915148800 1))
           (date->time-utc (make-date 0 59 59 23 31 12 1998 0))))
 ;; yes, I think this is acutally right.
 (test-assert "date->time-utc conversion test 3"
   (time=? (make-time time-utc 0 (- 915148800 0))
           (date->time-utc (make-date 0 60 59 23 31 12 1998 0))))
 (test-assert "date->time-utc conversion test 4"
   (time=? (make-time time-utc 0 (- 915148800 0))
           (date->time-utc (make-date 0 0 0 0 1 1 1999 0))))
 (test-assert "date->time-utc conversion test 5"
   (time=? (make-time time-utc 0 (+ 915148800 1))
           (date->time-utc (make-date 0 1 0 0 1 1 1999 0)))))


(test-group
 "[SRFI Tests] TZ Offset conversions"
 (let ((ct-utc (make-time time-utc 6320000 1045944859))
       (ct-tai (make-time time-tai 6320000 1045944891))
       (cd (make-date 6320000 19 14 15 22 2 2003 -18000)))
   (test-assert "(time=? ct-utc (date->time-utc cd))"
     (time=? ct-utc (date->time-utc cd)))
   (test-assert "(time=? ct-tai (date->time-tai cd))"
     (time=? ct-tai (date->time-tai cd)))))


(test-group
 "Creating date structures"
 (test-assert "(current-date) must return a value"
   (not (null? (current-date))))
 (test-assert "(current-date) must take a time-zone offset"
   (not (null? (current-date 2))))
 (test-assert "(current-julian-day) must return a value"
   (not (null? (current-julian-day))))
 (test-assert "(current-julian-day) must return a number"
   (number? (current-julian-day)))
 (test-assert "(current-modified-julian-day) must return a value"
   (not (null? (current-modified-julian-day))))
 (test-assert "(current-modified-julian-day) must return a number"
   (number? (current-modified-julian-day))))

(test-group
 "Creating time structures"
 (test-assert "(current-time) must return a time"
   (time? (current-time)))
 (test-assert "(current-time 'time-tai) must return a time"
   (time? (current-time 'time-tai)))
 (test-assert "(current-time 'time-utc) must return a time"
   (time? (current-time 'time-utc)))
 (test-assert "(current-time 'time-monotonic) must return a time"
   (time? (current-time 'time-monotonic)))
 (test-assert "(current-time 'time-thread) must return a time"
   (time? (current-time 'time-thread)))
 (test-assert "(current-time 'time-process) must return a time"
   (time? (current-time 'time-process))))


(test-group
 "Clock resolution"
 (test-assert "(time-resolution) must return an integer"
   (integer? (time-resolution)))
 (test-assert "(time-resolution 'time-tai) must return an integer"
   (integer? (time-resolution 'time-tai)))
 (test-assert "(time-resolution 'time-utc) must return an integer"
   (integer? (time-resolution 'time-utc)))
 (test-assert "(time-resolution 'time-monotonic) must return an integer"
   (integer? (time-resolution 'time-monotonic)))
 (test-assert "(time-resolution 'time-thread) must return an integer"
   (integer? (time-resolution 'time-thread)))
 (test-assert "(time-resolution 'time-process) must return an integer"
   (integer? (time-resolution 'time-process))))

(test-group
 "Time object and accessors"
 (test-assert "(make-time) must return a time"
   (time? (make-time 'time-tai 500 1000)))
 (let ((simple-time1 (make-time 'time-utc 7 5))
       (simple-time2 (make-time 'time-tai 120 5000)))
   (test-assert "(time?) should be true for a time"
     (time? simple-time1))
   (test-not "(time?) should be false for a number"
             (time? 1))
   (test "(time-type) should return correct type1"
         'time-utc (time-type simple-time1))
   (test "(time-type) should return correct type2"
         'time-tai (time-type simple-time2))
   (test "(time-nanosecond) should return correct value1"
         7 (time-nanosecond simple-time1))
   (test "(time-nanosecond) should return correct value2"
         120 (time-nanosecond simple-time2))
   (test "(time-second) should return correct value1"
         5 (time-second simple-time1))
   (test "(time-second) should return correct value2"
         5000 (time-second simple-time2))
   (set-time-type! simple-time1 'time-monotonic)
   (test "(set-time-type!) should set correct value"
         'time-monotonic (time-type simple-time1))
   (set-time-nanosecond! simple-time1 43)
   (test "(set-time-nanosecond!) should set correct value"
         43 (time-nanosecond simple-time1))
   (set-time-second! simple-time1 58)
   (test "(set-time-second!) should set correct value"
         58 (time-second simple-time1))
   (let ((copy-of-simple-time1 (copy-time simple-time1)))
     (test "(copy-time) should set correct time-type value"
           'time-monotonic (time-type copy-of-simple-time1))
     (test "(copy-time) should set correct nanosecond value"
           43 (time-nanosecond copy-of-simple-time1))
     (test "(copy-time) should set correct second value"
           58 (time-second copy-of-simple-time1)))))


(test-group
 "Time comparison procedures"
 (let ((low (make-time 'time-utc 0 1))
       (equal-to-low (make-time 'time-utc 0 1))
       (high (make-time 'time-utc 0 999)))
   (test-assert "(time<=? low high)" (time<=? low high))
   (test-assert "(time<=? low also-low)" (time<=? low equal-to-low))
   (test-not "(time<=? high low)" (time<=? high low))

   (test-assert "(time<? low high)" (time<? low high))
   (test-not "(time<? low also-low)" (time<? low equal-to-low))
   (test-not "(time<? high low)" (time<? high low))

   (test-not "(time=? low high)" (time=? low high))
   (test-assert "(time=? low also-low)" (time=? low equal-to-low))
   (test-not "(time=? high low)" (time=? high low))

   (test-not "(time>=? low high)" (time>=? low high))
   (test-assert "(time>=? low also-low)" (time>=? low equal-to-low))
   (test-assert "(time>=? high low)" (time>=? high low))

   (test-not "(time>? low high)" (time>? low high))
   (test-not "(time>? low also-low)" (time>? low equal-to-low))
   (test-assert "(time>? high low)" (time>? high low))))


(test-group
 "Time arithmetic procedures"
 (test-group
  "(time-difference)"
  (let ((earlier (make-time 'time-utc 30 750))
        (later (make-time 'time-utc 20 700)))
    (test-assert "(time-difference earlier later) returns a time"
      (time? (time-difference earlier later)))
    (test-assert "(time-difference earlier later) returns correct time value"
      (time=? (make-time 'time-duration 10 50) (time-difference earlier later)))
    (test "(time-difference earlier later) returns correct seconds value"
          50 (time-second (time-difference earlier later)))
    (test "(time-difference earlier later) returns correct nanoseconds value"
          10 (time-nanosecond (time-difference earlier later)))
    ;; The nanosecond fraction is always positive - sign is determined by the seconds.
    ;; Apparently.
    (test-assert "(time-difference later earlier) returns correct time value"
      (time=? (make-time 'time-duration 10 -50) (time-difference later earlier)))
    (test "(time-difference later earlier) returns correct seconds value"
          -50 (time-second (time-difference later earlier)))
    (test "(time-difference later earlier) returns correct nanoseconds value"
          10 (time-nanosecond (time-difference later earlier)))))
 (test-group
  "(time-difference!)"
  ;; (time-difference!) can use the first argument for the result. The standard implementation
  ;; does this, but it sets the time-type to time-duration before doing the time=? check, so
  ;; it throws an error if you try to use it with any type other than time-duration. I'm not
  ;; sure if this is by design or not.
  (test-assert "(time-difference! earlier later) returns a time"
    (time? (time-difference! (make-time 'time-duration 30 750)
                             (make-time 'time-duration 20 700))))
  (test-assert "(time-difference! earlier later) returns correct time value"
    (time=? (make-time 'time-duration 10 50)
            (time-difference! (make-time 'time-duration 30 750)
                              (make-time 'time-duration 20 700))))
  (test "(time-difference! earlier later) returns correct seconds value"
        50 (time-second (time-difference! (make-time 'time-duration 30 750)
                                          (make-time 'time-duration 20 700))))
  (test "(time-difference! earlier later) returns correct nanoseconds value"
        10 (time-nanosecond (time-difference! (make-time 'time-duration 30 750)
                                              (make-time 'time-duration 20 700))))
  ;; The nanosecond fraction is always positive - sign is determined by the seconds.
  ;; Apparently.
  (test-assert "(time-difference! later earlier) returns correct time value"
    (time=? (make-time 'time-duration 10 -50)
            (time-difference! (make-time 'time-duration 20 700)
                              (make-time 'time-duration 30 750))))
  (test "(time-difference! later earlier) returns correct seconds value"
        -50 (time-second (time-difference! (make-time 'time-duration 20 700)
                                           (make-time 'time-duration 30 750))))
  (test "(time-difference! later earlier) returns correct nanoseconds value"
        10 (time-nanosecond (time-difference! (make-time 'time-duration 20 700)
                                              (make-time 'time-duration 30 750)))))
 (test-group
  "(add-duration)"
  (test-assert "(add-duration) returns a time"
    (time? (add-duration (make-time 'time-utc 30 1000)
                         (make-time 'time-duration 5 750))))
  (test "(add-duration) returns correct value for type"
        'time-utc (time-type (add-duration (make-time 'time-utc 30 1000)
                                           (make-time 'time-duration 5 750))))
  (test "(add-duration) returns correct value for nanoseconds"
        35 (time-nanosecond (add-duration (make-time 'time-utc 30 1000)
                                          (make-time 'time-duration 5 750))))
  (test "(add-duration) returns correct value for seconds"
        1750 (time-second (add-duration (make-time 'time-utc 30 1000)
                                        (make-time 'time-duration 5 750)))))
 (test-group
  "(add-duration!)"
  (test-assert "(add-duration!) returns a time"
    (time? (add-duration! (make-time 'time-utc 30 1000)
                          (make-time 'time-duration 5 750))))
  (test "(add-duration!) returns correct value for type"
        'time-utc (time-type (add-duration! (make-time 'time-utc 30 1000)
                                            (make-time 'time-duration 5 750))))
  (test "(add-duration!) returns correct value for nanoseconds"
        35 (time-nanosecond (add-duration! (make-time 'time-utc 30 1000)
                                           (make-time 'time-duration 5 750))))
  (test "(add-duration!) returns correct value for seconds"
        1750 (time-second (add-duration! (make-time 'time-utc 30 1000)
                                         (make-time 'time-duration 5 750)))))
 (test-group
  "(subtract-duration)"
  (test-assert "(subtract-duration) returns a time"
    (time? (subtract-duration (make-time 'time-utc 30 1000)
                              (make-time 'time-duration 5 750))))
  (test "(subtract-duration) returns correct value for type"
        'time-utc (time-type (subtract-duration (make-time 'time-utc 30 1000)
                                                (make-time 'time-duration 5 750))))
  (test "(subtract-duration) returns correct value for nanoseconds"
        25 (time-nanosecond (subtract-duration (make-time 'time-utc 30 1000)
                                               (make-time 'time-duration 5 750))))
  (test "(subtract-duration) returns correct value for seconds"
        250 (time-second (subtract-duration (make-time 'time-utc 30 1000)
                                            (make-time 'time-duration 5 750)))))
 (test-group
  "(subtract-duration!)"
  (test-assert "(subtract-duration!) returns a time"
    (time? (subtract-duration! (make-time 'time-utc 30 1000)
                               (make-time 'time-duration 5 750))))
  (test "(subtract-duration!) returns correct value for type"
        'time-utc (time-type (subtract-duration! (make-time 'time-utc 30 1000)
                                                 (make-time 'time-duration 5 750))))
  (test "(subtract-duration!) returns correct value for nanoseconds"
        25 (time-nanosecond (subtract-duration! (make-time 'time-utc 30 1000)
                                                (make-time 'time-duration 5 750))))
  (test "(subtract-duration!) returns correct value for seconds"
        250 (time-second (subtract-duration! (make-time 'time-utc 30 1000)
                                             (make-time 'time-duration 5 750))))))


(test-group
 "Date object and accessors"
 (test-assert "(make-date) returns a date"
   (date? (make-date 1 1 1 1 1 1 1 1)))
 (let ((date1 (make-date 1 1 1 1 1 1 1 1))
       (date2 (make-date 2 2 2 2 2 2 2 2)))
   (test-assert "(date?) should return true for a date"
     (date? date1))
   (test-not "(date?) should return false for a number"
             (date? 1))
   (test "(date-nanosecond date1) should return 1"
         1 (date-nanosecond date1))
   (test "(date-nanosecond date2) should return 2"
         2 (date-nanosecond date2))
   (test "(date-second date1) should return 1"
         1 (date-second date1))
   (test "(date-second date2) should return 2"
         2 (date-second date2))
   (test "(date-minute date1) should return 1"
         1 (date-minute date1))
   (test "(date-minute date2) should return 2"
         2 (date-minute date2))
   (test "(date-hour date1) should return 1"
         1 (date-hour date1))
   (test "(date-hour date2) should return 2"
         2 (date-hour date2))
   (test "(date-day date1) should return 1"
         1 (date-day date1))
   (test "(date-day date2) should return 2"
         2 (date-day date2))
   (test "(date-month date1) should return 1"
         1 (date-month date1))
   (test "(date-month date2) should return 2"
         2 (date-month date2))
   (test "(date-year date1) should return 1"
         1 (date-year date1))
   (test "(date-year date2) should return 2"
         2 (date-year date2))
   (test "(date-zone-offset date1) should return 1"
         1 (date-zone-offset date1))
   (test "(date-zone-offset date2) should return 2"
         2 (date-zone-offset date2))
   (test "(date-year-day) should return 1"
         1 (date-year-day (make-date 0 0 0 0 1 1 2017 0)))
   (test "(date-year-day) should return 4"
         4 (date-year-day (make-date 0 0 0 0 4 1 2017 0)))
   (test "(date-week-day) should return 0"
         0 (date-week-day (make-date 0 0 0 0 1 1 2017 0))) ; 1st January 2017 was a Sunday
   (test "(date-week-day) should return 3"
         3 (date-week-day (make-date 0 0 0 0 4 1 2017 0))) ; 1st January 2017 was a Sunday
   (test "(date-week-number) should return 1"
         0 (date-week-number (make-date 0 0 0 0 1 1 2017 0) 0))
   (test "(date-week-number) should return 4"
         3 (date-week-number (make-date 0 0 0 0 25 1 2017 0) 0))))

;; I don't have a lot of faith in the values I use here. These tests codify current
;; behaviour, and allow tracking of breaking changes, but I'm not convinced they are
;; all correct.
;;
;; For instance, NASA says 2457755 is 1st January 2017, not 2457753...
;;
;; I got test values for Julian dates from:
;;   http://aa.usno.navy.mil/data/docs/JulianDate.php
;;
;; Also, from http://scienceworld.wolfram.com/astronomy/ModifiedJulianDate.html :
;;    A modified version of the Julian date denoted MJD obtained by subtracting
;;    2,400,000.5 days from the Julian date JD, The MJD therefore gives the number of days
;;    since midnight on November 17, 1858. This date corresponds to 2400000.5 days after
;;    day 0 of the Julian calendar.
(test-group
 "Time/Date/Julian Day/Modified Julian Day Converters"
 (test-group
  "date->julian-day"
  (test "Julian day for 1st January 2017"
        2457753 (floor (date->julian-day (make-date 0 0 0 14 1 1 2017 1)))))
 (test-group
  "date->modified-julian-day"
  (test "Modified Julian day for 1st January 2017"
        (- 2457753 2400000)
        (floor (date->modified-julian-day (make-date 0 0 0 14 1 1 2017 1)))))
 (test-group
  "date->time-monotonic"
  (test "(date->time-monotonic) value for 1st January 2017"
        1483279233 (time-second (date->time-monotonic (make-date 0 0 0 14 1 1 2017 1))))
  (test "(date->time-monotonic) returns 'time-monotonic"
        'time-monotonic (time-type (date->time-monotonic (make-date 0 0 0 14 1 1 2017 1)))))
 (test-group
  "date->time-tai"
  (test "(date->time-tai) value for 1st January 2017"
        1483279233 (time-second (date->time-tai (make-date 0 0 0 14 1 1 2017 1))))
  (test "(date->time-tai) returns type time-tai"
        'time-tai (time-type (date->time-tai (make-date 0 0 0 14 1 1 2017 1)))))
 (test-group
  "date->time-utc"
  (test "(date->time-utc) returns type time-utc"
        'time-utc (time-type (date->time-utc (make-date 0 0 0 14 1 1 2017 1)))))
 (test "(date->time-utc) value for 1st January 2017"
       1483279199 (time-second (date->time-utc (make-date 0 0 0 14 1 1 2017 1))))
 (test-group
  "julian-day->date"
  (let ((target-date (julian-day->date 2457755)))
    (test-assert "(julian-day->date) returns date"
      (date? target-date))
    (test "(julian-day->date) for 1st January 2017 (year)"
          2017 (date-year target-date))
    (test "(julian-day->date) for 1st January 2017 (month)"
          1 (date-month target-date))
    (test "(julian-day->date) for 1st January 2017 (day)"
          1 (date-day target-date)))
  (let ((target-date (julian-day->date 2457755 6)))
    (test "(julian-day->date) with offset for 1st January 2017 (year)"
          2017 (date-year target-date))
    (test "(julian-day->date) with offset for 1st January 2017 (month)"
          1 (date-month target-date))
    (test "(julian-day->date) with offset for 1st January 2017 (day)"
          1 (date-day target-date))))
 (test-group
  "julian-day->time-monotonic"
  (test "(julian-day->time-monotonic) returns type time-monotonic"
        'time-monotonic (time-type (julian-day->time-monotonic 2457755)))
  (test "(julian-day->time-monotonic) for 1st January 2017"
        1483272034 (time-second (julian-day->time-monotonic 2457755))))
 (test-group
  "julian-day->time-tai"
  (test "(julian-day->time-tai) returns type time-tai"
        'time-tai (time-type (julian-day->time-tai 2457755)))
  (test "(julian-day->time-tai) for 1st January 2017"
        1483272034 (time-second (julian-day->time-tai 2457755))))
 (test-group
  "julian-day->time-utc"
  (test "(julian-day->time-utc) returns type time-utc"
        'time-utc (time-type (julian-day->time-utc 2457755)))
  (test "(julian-day->time-utc) for 1st January 2017"
        1483272000 (time-second (julian-day->time-utc 2457755))))
 (test-group
  "modified-julian-day->date"
  (let ((target-date (modified-julian-day->date 57754)))
    (test-assert "(modified-julian-day->date) returns date"
      (date? target-date))
    (test "(modified-julian-day->date) for 1st January 2017 (year)"
          2017 (date-year target-date))
    (test "(modified-julian-day->date) for 1st January 2017 (month)"
          1 (date-month target-date))
    (test "(modified-julian-day->date) for 1st January 2017 (day)"
          1 (date-day target-date)))
  (let ((target-date (modified-julian-day->date 57754 6)))
    (test "(modified-julian-day->date) with offset for 1st January 2017 (year)"
          2017 (date-year target-date))
    (test "(modified-julian-day->date) with offset for 1st January 2017 (month)"
          1 (date-month target-date))
    (test "(modified-julian-day->date) with offset for 1st January 2017 (day)"
          1 (date-day target-date))))
 (test-group
  "modified-julian-day->time-monotonic"
  (test "(modified-julian-day->time-monotonic) returns type time-monotonic"
        'time-monotonic (time-type (modified-julian-day->time-monotonic 2457755)))
  (test "(modified-julian-day->time-monotonic) for 1st January 2017"
        208843315234 (time-second (modified-julian-day->time-monotonic 2457755))))
 (test-group
  "modified-julian-day->time-tai"
  (test "(modified-julian-day->time-tai) returns type time-tai"
        'time-tai (time-type (modified-julian-day->time-tai 2457755)))
  (test "(modified-julian-day->time-tai) for 1st January 2017"
        208843315234 (time-second (modified-julian-day->time-tai 2457755))))
 (test-group
  "modified-julian-day->time-utc"
  (test "(modified-julian-day->time-utc) returns type time-utc"
        'time-utc (time-type (modified-julian-day->time-utc 2457755)))
  (test "(modified-julian-day->time-utc) for 1st January 2017"
        208843315200 (time-second (modified-julian-day->time-utc 2457755))))
 (test-group
  "time-monotonic->date"
  (let ((monotime (make-time 'time-monotonic 100 1000)))
    (test-assert "(time-monotonic->date) returns type time-monotonic"
      (date? (time-monotonic->date monotime)))
    (test "(time-monotonic->date) returns correct value"
          1970 (date-year (time-monotonic->date monotime)))
    (test "(time-monotonic->date) returns correct value"
          1 (date-month (time-monotonic->date monotime)))
    (test "(time-monotonic->date) returns correct value"
          1 (date-day (time-monotonic->date monotime)))
    (test "(time-monotonic->date) with offset returns correct value"
          1970 (date-year (time-monotonic->date monotime 5)))
    (test "(time-monotonic->date) with offset returns correct value"
          1 (date-month (time-monotonic->date monotime 5)))
    (test "(time-monotonic->date) with offset returns correct value"
          1 (date-day (time-monotonic->date monotime 5)))))
 (test-group
  "time-monotonic->julian-day"
  ;; 1483099234 is 1st January 2017
  (test-assert "(time-monotonic->julian-day) returns number"
    (number? (time-monotonic->julian-day
              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->julian-day) returns correct value"
        2457753 (time-monotonic->julian-day
                 (make-time 'time-monotonic 0 1483099234))))
 (test-group
  "time-monotonic->modified-julian-day"
  ;; 1483099234 is 1st January 2017
  (test-assert "(time-monotonic->modified-julian-day) returns number"
    (number? (time-monotonic->modified-julian-day
              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->modified-julian-day) returns correct value"
        57752 (floor (time-monotonic->modified-julian-day
                      (make-time 'time-monotonic 0 1483099234)))))
 (test-group
  "time-monotonic->time-tai"
  ;; 1483099234 is 1st January 2017
  (test "(time-monotonic->time-tai) returns type time-tai"
        'time-tai (time-type (time-monotonic->time-tai
                              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->time-tai) returns correct value"
        1483099234 (time-second (time-monotonic->time-tai
                                 (make-time 'time-monotonic 0 1483099234)))))
 (test-group
  "time-monotonic->time-tai!"
  ;; 1483099234 is 1st January 2017
  (test "(time-monotonic->time-tai!) returns type time-tai"
        'time-tai (time-type (time-monotonic->time-tai!
                              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->time-tai!) returns correct value"
        1483099234 (time-second (time-monotonic->time-tai!
                                 (make-time 'time-monotonic 0 1483099234)))))
 (test-group
  "time-monotonic->time-utc"
  ;; 1483099234 is 1st January 2017
  (test "(time-monotonic->time-utc) returns type time-utc"
        'time-utc (time-type (time-monotonic->time-utc
                              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->time-utc) returns correct value"
        1483099200 (time-second (time-monotonic->time-utc
                                 (make-time 'time-monotonic 0 1483099234)))))
 (test-group
  "time-monotonic->time-utc!"
  ;; 1483099234 is 1st January 2017
  (test "(time-monotonic->time-utc!) returns type time-utc"
        'time-utc (time-type (time-monotonic->time-utc!
                              (make-time 'time-monotonic 0 1483099234))))
  (test "(time-monotonic->time-utc!) returns correct value"
        1483099200 (time-second (time-monotonic->time-utc!
                                 (make-time 'time-monotonic 0 1483099234)))))
 ;; 43200 is 1st January 2017
 (test-group
  "time-tai->date"
  (let ((test-time (make-time 'time-tai 0 43200)))
    (test-assert "(time-tai->date) returns type time-tai"
      (date? (time-tai->date test-time)))
    (test "(time-tai->date) returns correct value"
          1970 (date-year (time-tai->date test-time)))
    (test "(time-tai->date) returns correct value"
          1 (date-month (time-tai->date test-time)))
    (test "(time-tai->date) returns correct value"
          1 (date-day (time-tai->date test-time)))
    (test "(time-tai->date) with offset returns correct value"
          1970 (date-year (time-tai->date test-time 5)))
    (test "(time-tai->date) with offset returns correct value"
          1 (date-month (time-tai->date test-time 5)))
    (test "(time-tai->date) with offset returns correct value"
          1 (date-day (time-tai->date test-time 5)))))
 (test-group
  "time-tai->julian-day"
  ;; 43200 is 1st January 2017
  (test-assert "(time-tai->julian-day) returns number"
    (number? (time-tai->julian-day
              (make-time 'time-tai 0 43200))))
  (test "(time-tai->julian-day) returns correct value"
        2440588 (time-tai->julian-day
                 (make-time 'time-tai 0 43200))))
 (test-group
  "time-tai->modified-julian-day"
  ;; 43200 is 1st January 2017
  (test-assert "(time-tai->modified-julian-day) returns number"
    (number? (time-tai->modified-julian-day
              (make-time 'time-tai 0 43200))))
  (test "(time-tai->modified-julian-day) returns correct value"
        40587 (floor (time-tai->modified-julian-day
                      (make-time 'time-tai 0 43200)))))
 (test-group
  "time-tai->time-monotonic"
  ;; 43200 is 1st January 2017
  (test "(time-tai->time-monotonic) returns type time-monotonic"
        'time-monotonic (time-type (time-tai->time-monotonic
                                    (make-time 'time-tai 0 43200))))
  (test "(time-tai->time-monotonic) returns correct value"
        43200 (time-second (time-tai->time-monotonic
                            (make-time 'time-tai 0 43200)))))
 (test-group
  "time-tai->time-monotonic!"
  ;; 43200 is 1st January 2017
  (test "(time-tai->time-monotonic!) returns type time-monotonic"
        'time-monotonic (time-type (time-tai->time-monotonic!
                                    (make-time 'time-tai 0 1483099234))))
  (test "(time-tai->time-monotonic!) returns correct value"
        1483099234 (time-second (time-tai->time-monotonic!
                                 (make-time 'time-tai 0 1483099234)))))
 (test-group
  "time-tai->time-utc"
  ;; 43200 is 1st January 2017
  (test "(time-tai->time-utc) returns type time-utc"
        'time-utc (time-type (time-tai->time-utc
                              (make-time 'time-tai 0 43200))))
  (test "(time-tai->time-utc) returns correct value"
        43200 (time-second (time-tai->time-utc
                            (make-time 'time-tai 0 43200)))))
 (test-group
  "time-tai->time-utc!"
  ;; 43200 is 1st January 2017
  (test "(time-tai->time-utc!) returns type time-utc"
        'time-utc (time-type (time-tai->time-utc!
                              (make-time 'time-tai 0 43200))))
  (test "(time-tai->time-utc!) returns correct value"
        43200 (time-second (time-tai->time-utc!
                            (make-time 'time-tai 0 43200)))))

 ;; 1483279199 is 1st January 2017
 (test-group
  "time-utc->date"
  (let ((test-time (make-time 'time-utc 0 1483279199)))
    (test-assert "(time-utc->date) returns type time-tai"
      (date? (time-utc->date test-time)))
    (test "(time-utc->date) returns correct value"
          2017 (date-year (time-utc->date test-time)))
    (test "(time-utc->date) returns correct value"
          1 (date-month (time-utc->date test-time)))
    (test "(time-utc->date) returns correct value"
          1 (date-day (time-utc->date test-time)))
    (test "(time-utc->date) with offset returns correct value"
          2017 (date-year (time-utc->date test-time 5)))
    (test "(time-utc->date) with offset returns correct value"
          1 (date-month (time-utc->date test-time 5)))
    (test "(time-utc->date) with offset returns correct value"
          1 (date-day (time-utc->date test-time 5)))))
 (test-group
  "time-utc->julian-day"
  ;; 1483279199 is 1st January 2017
  (test-assert "(time-utc->julian-day) returns number"
    (number? (time-utc->julian-day
              (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->julian-day) returns correct value"
        2457755 (floor (time-utc->julian-day
                        (make-time 'time-utc 0 1483279199)))))
 (test-group
  "time-utc->modified-julian-day"
  ;; 1483279199 is 1st January 2017
  (test-assert "(time-utc->modified-julian-day) returns number"
    (number? (time-utc->modified-julian-day
              (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->modified-julian-day) returns correct value"
        57754 (floor (time-utc->modified-julian-day
                      (make-time 'time-utc 0 1483279199)))))
 (test-group
  "time-utc->time-monotonic"
  ;; 1483279199 is 1st January 2017
  (test "(time-utc->time-monotonic) returns type time-monotonic"
        'time-monotonic (time-type (time-utc->time-monotonic
                                    (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->time-monotonic) returns correct value"
        1483279233 (time-second (time-utc->time-monotonic
                                 (make-time 'time-utc 0 1483279199)))))
 (test-group
  "time-utc->time-monotonic!"
  ;; 1483279199 is 1st January 2017
  (test "(time-utc->time-monotonic!) returns type time-monotonic"
        'time-monotonic (time-type (time-utc->time-monotonic!
                                    (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->time-monotonic!) returns correct value"
        1483279233 (time-second (time-utc->time-monotonic!
                                 (make-time 'time-utc 0 1483279199)))))
 (test-group
  "time-utc->time-tai"
  ;; 1483279199 is 1st January 2017
  (test "(time-utc->time-tai) returns type time-tai"
        'time-tai (time-type (time-utc->time-tai
                              (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->time-tai) returns correct value"
        1483279233 (time-second (time-utc->time-tai
                                 (make-time 'time-utc 0 1483279199)))))
 (test-group
  "time-utc->time-tai!"
  ;; 1483279199 is 1st January 2017
  (test "(time-utc->time-tai!) returns type time-tai"
        'time-tai (time-type (time-utc->time-tai!
                              (make-time 'time-utc 0 1483279199))))
  (test "(time-utc->time-tai!) returns correct value"
        1483279233 (time-second (time-utc->time-tai!
                                 (make-time 'time-utc 0 1483279199)))))
 )

(test-group
 "Date to String/String to Date Converters"
 (test-group
  "Standard date->string directives"
  (let ((basic-date (make-date 900000000 10 11 14 1 2 2017 0)))
    (test "Default string rendering"
          "Wed Feb 01 14:11:10Z 2017" (date->string basic-date))
    (test "ISO-8601 string rendering"
          "Wed Feb 01 14:11:10Z 2017" (date->string basic-date))
    (test "Full string rendering"
          "14:11:10 on Wednesday, 1st February 2017"
          (date->string basic-date "~T on ~A, ~g~u ~B ~Y"))
    (test "Format test: ~~"
          "~" (date->string basic-date "~~"))
    (test "Format test: ~a"
          "Wed" (date->string basic-date "~a"))
    (test "Format test: ~A"
          "Wednesday" (date->string basic-date "~A"))
    (test "Format test: ~b"
          "Feb" (date->string basic-date "~b"))
    (test "Format test: ~B"
          "February" (date->string basic-date "~B"))
    (test "Format test: ~c"
          "Wed Feb 01 14:11:10Z 2017" (date->string basic-date "~c"))
    (test "Format test: ~d"
          "01" (date->string basic-date "~d"))
    (test "Format test: ~D"
          "02/01/17" (date->string basic-date "~D"))
    (test "Format test: ~e"
          " 1" (date->string basic-date "~e"))
    (test "Format test: ~f"
          "10" (date->string basic-date "~f"))
    (test "Format test: ~h"
          "Feb" (date->string basic-date "~h"))
    (test "Format test: ~H"
          "14" (date->string basic-date "~H"))
    (test "Format test: ~I"
          "02" (date->string basic-date "~I"))
    (test "Format test: ~j"
          "032" (date->string basic-date "~j"))
    (test "Format test: ~k"
          "14" (date->string basic-date "~k"))
    (test "Format test: ~l"
          " 2" (date->string basic-date "~l"))
    (test "Format test: ~m"
          "02" (date->string basic-date "~m"))
    (test "Format test: ~M"
          "11" (date->string basic-date "~M"))
    (test "Format test: ~n"
          "\n" (date->string basic-date "~n"))
    (test "Format test: ~N"
          "900000000" (date->string basic-date "~N"))
    (test "Format test: ~p"
          "PM" (date->string basic-date "~p"))
    (test "Format test: ~r"
          "02:11:10 PM" (date->string basic-date "~r"))
    (test "Format test: ~s"
          "1485958270" (date->string basic-date "~s"))
    (test "Format test: ~S"
          "10" (date->string basic-date "~S"))
    (test "Format test: ~t"
          "\t" (date->string basic-date "~t"))
    (test "Format test: ~T"
          "14:11:10" (date->string basic-date "~T"))
    (test "Format test: ~U"
          "04" (date->string basic-date "~U"))
    (test "Format test: ~V"
          "04" (date->string basic-date "~V"))
    (test "Format test: ~w"
          "3" (date->string basic-date "~w"))
    (test "Format test: ~W"
          "05" (date->string basic-date "~W"))
    ;; From the SRFI:
    ;;   ~x	week number of year with Monday as first day of week (00...53)
    ;; However, the standard implementation returns a formatted date.
    (test "Format test: ~x"
          "02/01/17" (date->string basic-date "~x"))
    ;; From the SRFI:
    ;;  ~X	locale's date representation, for example: "07/31/00"
    ;; However, the standard implementation returns a formatted time.
    (test "Format test: ~X"
          "14:11:10" (date->string basic-date "~X"))
    (test "Format test: ~y"
          "17" (date->string basic-date "~y"))
    (test "Format test: ~Y"
          "2017" (date->string basic-date "~Y"))
    (test "Format test: ~z"
          "Z" (date->string basic-date "~z"))
    (test "Format test: ~Z"
          "" (date->string basic-date "~Z"))
    (test "Format test: ~1"
          "2017-02-01" (date->string basic-date "~1"))
    (test "Format test: ~2"
          "14:11:10Z" (date->string basic-date "~2"))
    (test "Format test: ~3"
          "14:11:10" (date->string basic-date "~3"))
    (test "Format test: ~4"
          "2017-02-01T14:11:10Z" (date->string basic-date "~4"))
    (test "Format test: ~5"
          "2017-02-01T14:11:10" (date->string basic-date "~5"))))
 (test-group
  "Non-standard date->string directives"
    ;; Our non-standard directive for outputting the date without any padding.
    (test "Format test: ~g" "1" (date->string (make-date 0 0 0 0 1 2 2017 0) "~g"))
    ;; Our non-standard directive for outputting the suffix of the day, e.g. "rd" for 3.
    (test "Format test: ~u" "st" (date->string (make-date 0 0 0 0 1 1 2017 0) "~u"))
    (test "Format test: ~u" "nd" (date->string (make-date 0 0 0 0 2 1 2017 0) "~u"))
    (test "Format test: ~u" "rd" (date->string (make-date 0 0 0 0 3 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 4 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 5 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 6 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 7 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 8 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 9 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 10 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 11 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 12 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 13 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 14 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 15 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 16 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 17 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 18 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 19 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 20 1 2017 0) "~u"))
    (test "Format test: ~u" "st" (date->string (make-date 0 0 0 0 21 1 2017 0) "~u"))
    (test "Format test: ~u" "nd" (date->string (make-date 0 0 0 0 22 1 2017 0) "~u"))
    (test "Format test: ~u" "rd" (date->string (make-date 0 0 0 0 23 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 24 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 25 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 26 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 27 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 28 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 29 1 2017 0) "~u"))
    (test "Format test: ~u" "th" (date->string (make-date 0 0 0 0 30 1 2017 0) "~u"))
    (test "Format test: ~u" "st" (date->string (make-date 0 0 0 0 31 1 2017 0) "~u")))
 ;; It's hard to have a test that parses just a bit of a date, so just create
 ;; a few tests that exercise all the parse options
 (test-group
  "Standard string->date directives"
  (test-assert "Default date creation from string"
    (tm:date= (make-date 0 14 13 12 1 1 2017 0)
              (string->date "Sun Jan 01 12:13:14Z 2017" "~a ~b ~d ~H:~M:~S~z ~Y")))
  (test-assert "Alternate date creation from string"
    (tm:date= (make-date 0 14 13 12 1 1 2017 0)
              (string->date "X Sunday January  1 12:13:14Z 17" "X ~A ~B ~e ~k:~M:~S~z ~y")))
  (test-assert "Second date creation from string"
    (tm:date= (make-date 0 14 13 12 1 1 2017 0)
              (string->date "~ Sunday 01  1 12:13:14Z 17" "~~ ~A ~m ~e ~k:~M:~S~z ~y")))))

(test-end)
