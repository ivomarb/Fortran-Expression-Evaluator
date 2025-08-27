# To Run this Interpreter

## On Linux (Ubuntu)

1. Install the GNU Fortran compiler: `sudo apt-get install gfortran`
1. Compile the source code: `gfortran -ffree-line-length-none -o test interpreter.f90 test.f90`
1. Run the program: `./test`