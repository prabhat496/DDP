% This could work as a lookup table for variable names and

% COLLECTOR
% 	DIMESIONS

L_collector 			% Length of the collector
D_hydrolic			% Hydrolic diameter of pipe
width_collector 		% Width of the collector
beta				% Angle of tilt of collector from the ground
gap_bottom_plate		% gap between plate and bottom insulations
gap_plate_glazing		% Gap between plate and glazing
g_acc				% Gravitational Acceleration
epsilon_g			% Emissivity of glazing
epsilon_p			% Emissivity of plate
tau_alpha			% Tau alpha constant
kin_viscosity			% Kinematic viscosity of fluid
therm_diffusivity		% therm_diffusivity
vol_expan_coeff			% Voumetric expansion coefficient ( 1/T for ideal gases )
v_air				% Velocity of air
m_flow				% Mass flow rate of the air
rho_air				% Density of the air
therm_conductivity		% Thermal Conductivity of the air
C_air				% Heat Capacity of the air (constant pressure)


% NUMBERS
rayleigh			% rayleigh number
Nu_pg				% Nusselt number b/w plate and glazing
sigma				% Stefan constant
prandtl				% Prandtl Number
reynolds			% Reynold's Number
Nu_pf				% Nusselt number b/w plate and working fluid

% TEMPERATURES
T_ambient			% Ambient Temperature
T_glazing			% Glazing Temperature
T_plate				% Plate Temperature
T_fluid				% Temperature of the working fluid
T_sky				% Sky Temperature
S				% Hourly average of Solar Radiation

% HEAT TRANSFER COEFFICIENTS
%	RADIATIVE HEAT TRANSFER COEFFICIENTS
h_rpg				% Radiation Heat Transfer Coeff. b/w plate and glazing
h_rs				% Radiation Heat Transfer Coeff. b/w glazing and sky

%	CONVECTIVE HEAT TRANSFER COEFFICIENTS
h_wind				% Convective Heat Transfer Coeff. b/w glazing and ambient
h_cpg				% Convective heat transfer Coeff. b/w Plate and Glazing
h_cpf				% Convective heat transfer Coeff. b/w Plate and working fuild


% HEAT RESISTANCES

R_pf				% Heat Resistance between Plate and working fluid
R_pg				% Heat Resistance between Plate and glazing
R_ga				% Heat Resistance between galzing and ambient
