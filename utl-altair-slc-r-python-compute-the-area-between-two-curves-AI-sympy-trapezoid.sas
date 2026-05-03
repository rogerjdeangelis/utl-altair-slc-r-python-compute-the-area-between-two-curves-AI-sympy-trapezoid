%let pgm=utl-altair-slc-r-python-compute-the-area-between-two-curves-AI-sympy-trapezoid;

%stop_submission;

Altair slc r python compute the area between two curves AI sympy trapezoid

Too long to post here, see github
https://github.com/rogerjdeangelis/utl-altair-slc-r-python-compute-the-area-between-two-curves-AI-sympy-trapezoid

[SIWMENS FORUM](https://support.industry.siemens.com/cs/document/42469594)
https://support.industry.siemens.com/cs/document/42469594

   Three Solutions

       1 python symbolic calculus
       2 r pracma traezoid


INPUT (WNAT THE ARE Y1(x) = Y2(x) for x=0 to 1 )

                2
  Y1(x) = x*(1-x )

  Y2(x) = x*(1-x)

                           X
        0.0    0.2    0.4    0.6    0.8    1.0
  Y  ---+------+------+------+------+------+---  Y
     |                                        |
  0.4+ Y1(X) = X*(X-1)                        +0.4
     | Y2(X) = X*(1-X^2)  ******* Y=X*(1-X^2) |
     |                 ***     ***            |
     | Area between=  ** 0.8333  **           |
     |  0.0833333   ***           **          |
  0.3+             **  Y=X*(1-X^2) **         +0.3
     |            **                **        |
  Y  |           **      xxx         *        |
     |           *   xxxxxxxxxx      **       |  Y
     |          ** xxx        xxxx    *       |
  0.2+         **xx              xx    *      +0.2
     |        **xx   Y=X*(1-X)    xx   **     |
     |       **xx                  xxx  *     |
     |       *x    Area Between      xx *     |
     |      **      Integrate         xx**    |
  0.1+     ** 1                        xx*    +0.1
     |    ** /                          x**   |
     |    *  | x*(1-x^2)-x*(1-x)dx      xx*   |
     |   ** /                            x*   |
     |  **  0                             **  |
  0.0+  *AREA= X^3/3 -X^4/4=1/12=0.083333  *  +0.0
     |                                        |
     ---+------+------+------+------+------+---
       0.0    0.2    0.4    0.6    0.8    1.0
                         X
/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

              2
Y1(x) = x*(1-x )

Y2(x) = x*(1-x)

Domain [0,1]

/*                       _           _ _                 _            _
/ |  ___ _   _ _ __ ___ | |__   ___ | (_) ___   ___ __ _| | ___ _   _| |_   _ ___
| | / __| | | | `_ ` _ \| `_ \ / _ \| | |/ __| / __/ _` | |/ __| | | | | | | / __|
| | \__ \ |_| | | | | | | |_) | (_) | | | (__ | (_| (_| | | (__| |_| | | |_| \__ \
|_| |___/\__, |_| |_| |_|_.__/ \___/|_|_|\___| \___\__,_|_|\___|\__,_|_|\__,_|___/
         |___/
*/

options validvarname=v7;
options set=PYTHONHOME "D:\py314";
proc python;
submit;
import pyperclip as pyp;
from sympy import *;
x, y = symbols( 'x y');
dif = x*(1-x**2) - x*(1-x);
integral = integrate(dif, x);
print(integral);
area = integrate(-x**3+x**2,(x,0,1));
print(area);
pyp.copy('area = '
     + str(integral)
     + ' from 0 to 1 = '
     + str(area));
endsubmit;
run;

filename in clipbrd;
data want;
  infile in;
  input;
  put "area = " _infile_;
run;

/**************************************************************************************************************************/
/*  Altair SLC                                                                                                            */
/*                                                                                                                        */
/* The PYTHON Procedure                                                                                                   */
/*                                                                                                                        */
/* -x**4/4 + x**3/3                                                                                                       */
/*                                                                                                                        */
/* 1/12                                                                                                                   */
/**************************************************************************************************************************/


options validvarname=v7;
options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
proc r;
submit;
library(pracma)

# Define functions
Y1 <- function(x) x * (1 - x^2)
Y2 <- function(x) x * (1 - x)

area <- integral(function(x) Y1(x) - Y2(x), 0, 1)

writeClipboard(as.character(area))
print(area);
endsubmit;
run;

filename in clipbrd;
data want;
  infile in;
  input;
  put "area = " _infile_;
run;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
