# Computational Fluid Dynamics Assignment

## Question: 
Consider 1-D Hyperbolic equation U_t  + cU_x  = 0 where U is scalar and 𝑐 is a constant wave speed (c > 0). Taking the computational domain 0 ≤ x ≤ 1, start with the following initial condition, 

a) U (x,0) =  sin⁡(2πx) 

b) U (x,0) = {(1 when x≤0.25 and 0 when x>0.25)}

Use Courant-Isaacson-Rees (CIR) method and Lax-Wendroff Scheme, advance the solutions by a distance equal to the half of the length of the computational domain with courant number λ=0.25,0.5,0.75,1.0 . Make plots of exact and computed solution for a given λ. Comment on the results based on the theoretical analysis

## Answers for Initial condition (a):

The code " CIR-scheme-initial1.m " is for CIR scheme when initial condition is U (x, 0) = sin(2πx), periodic boundary condition and when N = 100. 

Graphs obtained for CIR-Scheme:
When N = 100;
![Screenshot (1518)](https://user-images.githubusercontent.com/39788520/141118039-abc1c6f4-22aa-499e-a9ff-be740cb74a5e.png)
When N = 50;
![Screenshot (1522)](https://user-images.githubusercontent.com/39788520/141118199-41475188-23c4-48ae-9142-e1bd3a50fbc1.png)

The code "LW-SCHEME-func1.m " is for Lax-Wendroff scheme when initial condition is U (x,0) =  sin(2πx), periodic boundary condition and when N = 100.

Graphs obtained for Lax-Wendroff Scheme:
When N = 100;
![Screenshot (1523)](https://user-images.githubusercontent.com/39788520/141118515-cbcbf0cf-f19e-4dc5-adad-2d1c8723ff2e.png)
When N = 50;
![Screenshot (1519)](https://user-images.githubusercontent.com/39788520/141118587-db1b5b18-d6a6-4bca-9af2-4d57bde4185c.png)

### Comments on obtained results:
When the step size is lower, that is when N = 50, we see the graph deviates more than the exact solution. But when we increased N to 100, we are getting more accurate results. Similarly, for different lambda value or the Courant number we are getting solutions which are deviated from the exact solution. So, it is important to select the correct ratio value for dt/dx as well as more step size gives more accurate results. 
Now, coming to the type or error we can clearly see that while using CIR scheme we are getting smears in our graph which is the effect of numerical dissipation. In case of Lax-Wendroff scheme we are getting wiggle which is the effect of numerical dispersion.


## Answers for Initial condition (b):
The code " CIR-scheme-initial2.m " is for CIR scheme when initial condition is U(x,0) = (1 when x≤0.25 and 0 when x>0.25) when N = 100.

Graphs obtained for CIR-Scheme:
When N = 100;
![Screenshot (1524)](https://user-images.githubusercontent.com/39788520/141118997-1363a88c-6867-44f7-98bc-c1d15f82e780.png)
When N = 50;
![Screenshot (1525)](https://user-images.githubusercontent.com/39788520/141119148-1df403df-46dc-490b-894d-fa25323665db.png)

The code "LW-SCHEME-func2.m " is for Lax-Wendroff scheme for the second initial condition.

Graphs obtained for Lax-Wendroff scheme:
When N = 100;
![Screenshot (1527)](https://user-images.githubusercontent.com/39788520/141119391-0ca5857d-394e-4ddd-9c8e-5a4e488abe17.png)
When N = 50;
![Screenshot (1528)](https://user-images.githubusercontent.com/39788520/141119451-1056b561-6226-4a14-84d3-ce9fe51ff535.png)

### Comments on obtained results:
Coming to the type or error in linear initial condition, we can clearly see that while using CIR scheme we are getting smears in our graph. This is the effect of numerical dissipation which we have already seen when our initial condition was a function of sine. Dissipative errors depend on the sizes of the steps and therefore affect the accuracy of solution. In case of Lax-Wendroff scheme we are getting wiggles in our line graphs which is the effect of numerical dispersion.
The Lax-Wendroff algorithm is second-order accurate, which is why some dispersion error is expected. The oscillatory behaviour of the solution for the smaller Courant number clearly indicates the errors developed in the solution. The amplitude of the solution remains the same (within small errors) unlike the amplitude in CIR Scheme.
