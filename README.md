# Nonlinear_Dynamics_JL
Rewriting Fortran programs to Julia-lang.

## fractalgasket
![fractalgasket_image](fractalgasket/fractalgasket.png)

## fractaltree
![fractaltree_image](fractaltree/fractaltree.png)

## langford
<!-- $$
\begin{eqnarray}
  \left\{
    \begin{array}{l}
      \frac{dx}{dt} = (z-u)x-wy \\
      \frac{dy}{dt} = wx-(z-u)y \\
      \frac{dz}{dt} = n+z-\frac{z^3}{3}-(x^2+y^2)(1+lz)+ezx^3
    \end{array}
  \right. \nonumber
\end{eqnarray}
$$ --> 

<img style="background: white;" src="https://render.githubusercontent.com/render/math?math=%5Cbegin%7Beqnarray%7D%0D%0A%20%20%5Cleft%5C%7B%0D%0A%20%20%20%20%5Cbegin%7Barray%7D%7Bl%7D%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdx%7D%7Bdt%7D%20%3D%20(z-u)x-wy%20%5C%5C%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdy%7D%7Bdt%7D%20%3D%20wx-(z-u)y%20%5C%5C%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdz%7D%7Bdt%7D%20%3D%20n%2Bz-%5Cfrac%7Bz%5E3%7D%7B3%7D-(x%5E2%2By%5E2)(1%2Blz)%2Bezx%5E3%0D%0A%20%20%20%20%5Cend%7Barray%7D%0D%0A%20%20%5Cright.%20%5Cnonumber%0D%0A%5Cend%7Beqnarray%7D%0D">

![langfordRK4_image](langford/langfordRK4.png)

## logistic
<!-- $$
x_{n+1}=ax_n(1-x_n)
$$ --> 

<img style="background: white;" src="https://render.githubusercontent.com/render/math?math=x_%7Bn%2B1%7D%3Dax_n(1-x_n)%0D">

![logistic_image](logistic/logistic.png)

## lorenz
<!-- $$
\begin{eqnarray}
  \left\{
    \begin{array}{l}
      \frac{dx}{dt} = -px+py \\
      \frac{dy}{dt} = -xz+rx-y \\
      \frac{dz}{dt} = xy-bz
    \end{array}
  \right. \nonumber
\end{eqnarray}
$$ --> 

<img style="background: white;" src="https://render.githubusercontent.com/render/math?math=%5Cbegin%7Beqnarray%7D%0D%0A%20%20%5Cleft%5C%7B%0D%0A%20%20%20%20%5Cbegin%7Barray%7D%7Bl%7D%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdx%7D%7Bdt%7D%20%3D%20-px%2Bpy%20%5C%5C%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdy%7D%7Bdt%7D%20%3D%20-xz%2Brx-y%20%5C%5C%0D%0A%20%20%20%20%20%20%5Cfrac%7Bdz%7D%7Bdt%7D%20%3D%20xy-bz%0D%0A%20%20%20%20%5Cend%7Barray%7D%0D%0A%20%20%5Cright.%20%5Cnonumber%0D%0A%5Cend%7Beqnarray%7D%0D">

![lorenz_image](lorenz/lorenz.png)

## manderblot
<!-- $$
\begin{eqnarray}
z_{n+1}&=&z_n^2+c \nonumber \\
z_{n+1}&=&z_n^3+c \nonumber \\
z_{n+1}&=&z_n^4+c \nonumber \\
z_{n+1}&=&z_n^5+c \nonumber \\
z_{n+1}&=&\tan (z_n)+c \nonumber \\
z_{n+1}&=&\tan (z_n^4)+c \nonumber \\
z_{n+1}&=&\tan (z_n^27)+c \nonumber \\
z_{n+1}&=&\tan (z_n^256)+c \nonumber \\
z_{n+1}&=&\tan (z_n^3125)+c \nonumber
\end{eqnarray}
$$ --> 

<img style="background: white;" src="https://render.githubusercontent.com/render/math?math=%5Cbegin%7Beqnarray%7D%0D%0Az_%7Bn%2B1%7D%26%3D%26z_n%5E2%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26z_n%5E3%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26z_n%5E4%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26z_n%5E5%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26%5Ctan%20(z_n)%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26%5Ctan%20(z_n%5E4)%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26%5Ctan%20(z_n%5E27)%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26%5Ctan%20(z_n%5E256)%2Bc%20%5Cnonumber%20%5C%5C%0D%0Az_%7Bn%2B1%7D%26%3D%26%5Ctan%20(z_n%5E3125)%2Bc%20%5Cnonumber%0D%0A%5Cend%7Beqnarray%7D%0D">

![mandelbrot_p2_image](mandelbrot/out/mandelbrot_p2.png)

## randomwalk
![randomwalk_image](randomwalk/out/randomwalk1.png)