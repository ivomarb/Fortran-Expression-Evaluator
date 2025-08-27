program test
!
!	Purpose of the program:
!		This program aims to calculate the elapsed times that the developed evaluator
!		takes to evaluate five millions iterations for five different expressions, to
!		compare these times with the elapsed times of the direct calculation for the same
!		five millions iterations and also to show that the final results are compatible.
!
!	Authors:
!		Wilton P. Silva - wiltonps@uol.com.br
!		Ivomar B. Soares - ivomarbsoares@gmail.com
!
!	Disclaimer:
!		This code is provided "as is" no warranty. It should not be used for 
!       commercial use. Any change in the code is of entirely responsability 
!       of the user.
!
!   For Future Version:
!       Send us your email with message "about parser". 
!
!
use interpreter
!use dfport !Makes time function (timef) avalaible

!Variables used by the evaluator to build and to determine the value of the expressions
character(len = 10),  dimension(6) :: variables
real(realkind),       dimension(6) :: variablesvalues

!String variable that will store the function that the evaluator will build
character (len = 275)  :: func

!String variable that will return the building of the expression result 
!If everything was ok then statusflag = 'ok', otherwise statusflag = 'error'
character (len = 5)  :: statusflag


!Settings
!The number of variables can be increased
variables(1) = 'x'
variables(2) = 'y'
variables(3) = 'z'
variables(4) = 'x1'
variables(5) = 'a'
variables(6) = 'b'

x = 0.175
y = 0.110
z = 0.900
x1 = 0.508
a = 0.500
b = 0.750

variablesvalues(1) = x
variablesvalues(2) = y
variablesvalues(3) = z
variablesvalues(4) = x1
variablesvalues(5) = a
variablesvalues(6) = b



!First Expression																					 
!*****************************************************************************************************
!*****************************************************************************************************
!*****************************************************************************************************
write(*,*)
write(*,*) 'First Expression'
write(*,*) '===== =========='
write(*,*) '(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z)*2/&
			(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z))*3+sqrt(x*y*z+x+y+z)*&
			log10(sqrt(x*2+y*2+z*2)+x+y+z))*x1'

write(*,*)' '
write(*,*) 'Variables Values: x = 0.175, y = 0.110, z = 0.900, x1 = 0.508' 
write(*,*)' '

!
!Direct Calculation
!
write(*,*) 'Answer Obtained Through the Direct Calculation: ',(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*   &
			sin(y)+z*tan(z)*2/(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z))*3+sqrt(x*y*z  &
			+x+y+z)*log10(sqrt(x*2+y*2+z*2)+x+y+z))

write(*,*)' '

elapsedtime = timef()

!Five millions iterations
do i = 1, 5000000
	answer = (x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z)*2/(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z))*3+sqrt(x*y*z+x+y+z)*log10(sqrt(x*2+y*2+z*2)+x+y+z))
end do

elapsedtime = timef()
write(*,*) 'Elapsed Time at the Direct Calculation (five millions iterations): ',elapsedtime, 's.'
write(*,*)' '

!
!Evaluator Calculation
!
!String: Function to be evaluated
func =	'(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z)*2/(x+y+z+x*y+x*z+y*z+x/y+x/z+y/z+x*cos(x)+y*sin(y)+z*tan(z))*3+sqrt(x*y*z+x+y+z)*log10(sqrt(x*2+y*2+z*2)+x+y+z))'

!Initialize function
call init (func, variables, statusflag)

if(statusflag == 'ok') Then
  write(*,*)'Wait!'
  !Five millions iterations
  do i = 1, 5000000
  	answer = evaluate (variablesvalues)
  end do
  elapsedtime1 = TIMEF()
  write(*,*) 'Answer Obtained Through the Evaluator ', answer
  write(*,*)' '
  write(*,*) 'Elapsed Time at the Evaluation (five millions iterations): ',elapsedtime1 - elapsedtime,' s.'
else
  write(*,*)'Error detected'
end if
!*****************************************************************************************************
!*****************************************************************************************************
!*****************************************************************************************************



!Destroy the actual function at the evaluator
!********************************************
call destroyfunc()
!********************************************


write(*,*)
write(*,*)
write(*,*)
write(*,*)
write(*,*)



!Second Expression																					 
!*****************************************************************************************************
!*****************************************************************************************************
!*****************************************************************************************************
write(*,*) 'Second Expression'
write(*,*) '====== =========='
write(*,*) 'a+b*x1'

write(*,*)' '
write(*,*) 'Variables Values: a = 0.500, b = 0.750, x1 = 0.508' 
write(*,*)' '

!
!Direct Calculation
!
write(*,*) 'Answer Obtained Through the Direct Calculation: ', a+b*x1
write(*,*)' '

elapsedtime2 = timef()

!Five millions iterations
do i = 1, 5000000
	answer = a+b*x1
end do

elapsedtime3 = timef()
write(*,*) 'Elapsed Time at the Direct Calculation (five millions iterations): ',elapsedtime3 - elapsedtime2, 's.'
write(*,*)' '

!
!Evaluator Calculation
!
!String: Function to be evaluated
func = 'a+b*x1'

!Initializes function
call init (func, variables, statusflag)

if(statusflag == 'ok') Then
  write(*,*)'Wait!'
  !Five millions iterations
  do i = 1, 5000000
	answer = evaluate (variablesvalues)
  end do
  elapsedtime4 = TIMEF()
  write(*,*) 'Answer Obtained Through the Evaluator ', answer
  write(*,*)' '
  write(*,*) 'Elapsed Time at the Evaluation (five millions iterations): ',elapsedtime4 - elapsedtime3,' s.'
else
  write(*,*)'Error detected'
end if
!*****************************************************************************************************
!*****************************************************************************************************
!*****************************************************************************************************


end program