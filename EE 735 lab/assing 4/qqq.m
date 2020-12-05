% Abhijeet Aanand 160070031
% Microelectronics Simulation Lab (MSL) (EE 735)
% Assignment 4
% Question 2

% The given code plots the particle profile and its evolution with
% time by solving the diffusion equation with a delta source at 
% the middle of the region.
% The ends have perfectly absorbing boundary conditions

clear
% Initialised parameters  (cm is used everywhere)
D=1e-4;  % given 
source=1e6; % initial injection
d=1e-3;      % d is in cm      % 10um

n=1001; % number of grid points

dx=d/(n-1);
m=floor(n/2)+1;  % delta source location

dt=(dx*dx)/(2*D); % time step fixed (5e-9)

F=(dt*D)/(dx*dx); 

Nt=5; % number of time steps
% Solving equations
n_vector=zeros(n,1);

x_vector=zeros(n,1);
for i=1:n
    x_vector(i,1)=(i-1)*dx;
end


% Initialisation
for i=1:n
    n_vector(i,1)=0;
end

n_vector(m,1)=source ; % delta source initialisation

n_vector0=n_vector ;% initial n_vector for plotting

n_old_vector=n_vector;  % for updating
% main loop
n_new_vector =n_old_vector
for t=1:Nt
    
    for i=2:n-1
        n_new_vector(i,1)=n_old_vector(i,1)+F.*(n_old_vector(i+1,1)-2*(n_old_vector(i,1))+n_old_vector(i-1,1));
    end
    n_old_vector = n_new_vector;
    n_vector=n_old_vector;
    n_vector(1,1)=0;
    n_vector(n,1)=0;
    
    
    % storing values at specifi time instants
    if t==2
        n_vector1=n_vector;
    end
   
  end
    
  % plotting the respective plots 
  figure (1)
  plot(x_vector,n_vector1);
  xlabel('Distance(in cm)');
  ylabel('Particle Concentration (in cubic cm)');
  legend('After 500 nanoseconds', 'After 5 microseconds', 'After 50 microseconds','After 500 microseconds')
  title ('Numerical Solution of Diffusion Equation ')

  
 
  % Analytical solution
  n_analytical2=zeros(n,1);
  n_analytical3=zeros(n,1);
  n_analytical4=zeros(n,1);
  n_analytical5=zeros(n,1);
  
  for i=1:n
      n_analytical2(i,1)=(1./sqrt(4*pi*D*5e-7)).*(exp(-(x_vector(i,1)-5e-4)^(2)./(4*D*5e-7)));
      n_analytical3(i,1)=(1./sqrt(4*pi*D*5e-6)).*(exp(-(x_vector(i,1)-5e-4)^(2)/(4*D*5e-6)));
      n_analytical4(i,1)=(1./sqrt(4*pi*D*5e-5)).*(exp(-(x_vector(i,1)-5e-4)^(2)/(4*D*5e-5)));
      n_analytical5(i,1)=(1./sqrt(4*pi*D*5e-4)).*(exp(-(x_vector(i,1)-5e-4)^(2)/(4*D*5e-4)));
  end
  
  
  figure (2)
  plot(x_vector,n_analytical2,x_vector,n_analytical3,x_vector,n_analytical4,x_vector,n_analytical5);
  xlabel('Distance(in cm)');
  ylabel('Particle Concentration (in cubic cm)');
  legend('After 500 nanoseconds', 'After 5 microseconds', 'After 50 microseconds','After 500 microseconds')
  title ('Analytical Solution of Diffusion Equation ')  