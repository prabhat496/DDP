function [T_plate, T_glazing, T_bottom,  T_fluid] = chamber_iteration(T_plate, T_glazing, T_bottom, T_fluid, T_ambient)

	% Emissivity
	epsilon_plate 			= 0.95;
	epsilon_glazing 		= 0.8;
	epsilon_bottom          	= 0.8;

	% Properties of Air
	kinematic_viscosity       	= 1.81*(10^(-5));
	therm_diffusivity 		= 1.9*(10^(-5));
	therm_conductivity 		= 0.029;
	C_air 				= 1006;
	rho_air 			= 1.2;

	% Constants
	sigma				= 5.76*(10^(-8));
	tau_alpha 			= 0.8;
	air_velocity			= 0.1;
	sol_rad				= 500;
	insulation_conductivity		= 0.7;
	insulation_thickness		= 0.05;

	% Humidy related
	rel_humidity 			= 0.5;
	P_sat 				= (10^5)*exp((11.78*(T_ambient-372.79))/(T_ambient-43.15));
    	P_vap 				= rel_humidity*P_sat;
	humidity_ratio 			= 0.622*(P_vap)/(10^5 - P_vap);
	C_air 				= (1-humidity_ratio)*C_air + humidity_ratio*1850;

	% Dimensions
	width_chamber 			= 0.75;
	length_chamber 			= 0.03;
	gap_plate_bottom		= 0.08;
	gap_plate_glazing		= 0.005;
	D_hydrolic			= 2*(width_chamber*gap_plate_bottom)/(width_chamber+gap_plate_bottom);
	%beta				= pi/6;

	% Numbers

	% REYNOLDS
	Re_plate_bottom 		= air_velocity*(D_hydrolic)/(kinematic_viscosity);

	% PRANTL
	Pr_air_chamber 			= (kinematic_viscosity)/therm_diffusivity;

	% RAYLEIGH
	Ra_plate_glazing 		= rayleigh(T_plate, T_glazing, gap_plate_glazing, kinematic_viscosity, Pr_air_chamber);
	%Ra_bottom_fluid 		= rayleigh(T_bottom, T_fluid, gap_plate_bottom, kinematic_viscosity, Pr_air_chamber);
	Ra_plate_fluid			= rayleigh(T_plate, T_bottom, gap_plate_bottom, kinematic_viscosity, Pr_air_chamber);

	% NUSSELT NUMBERS
	Nu_plate_to_fluid 		= nusselt_chamber_plate_fluid(Ra_plate_fluid);
	Nu_bottom_to_fluid 		= nusselt_chamber_plate_fluid(Ra_plate_fluid);
	Nu_plate_to_glazing		= nusselt_chamber_plate_glazing(Ra_plate_glazing, Pr_air_chamber);

	% HEAT TRANSFER COEFFICIENT
	h_plate_to_fluid 		= Nu_plate_to_fluid*(therm_conductivity)/gap_plate_bottom;
	h_bottom_to_fluid		= Nu_bottom_to_fluid*(therm_conductivity)/gap_plate_bottom;
	h_plate_to_glazing		= Nu_plate_to_glazing*(therm_conductivity)/gap_plate_glazing;
	U_top_loss              	= top_loss_coefficient(T_glazing, T_ambient, sigma, epsilon_glazing);
	hr_plate_glazing		= h_radiation(sigma, T_plate, T_glazing, epsilon_plate, epsilon_glazing);
	hr_plate_bottom			= h_radiation(sigma, T_plate, T_bottom, epsilon_plate, epsilon_bottom);

	% --------------------------------------------------------------------------------------------------------------------------

	% HEAT EQUATIONS
	air_mass_flow_rate 		= air_velocity*(width_chamber)*(gap_plate_bottom)*(rho_air);
	T_glazing 			= ((hr_plate_glazing+h_plate_to_glazing)*T_plate + U_top_loss*T_ambient)/(hr_plate_glazing+h_plate_to_glazing+U_top_loss);
	T_plate				= (tau_alpha*sol_rad + T_glazing*(hr_plate_glazing+h_plate_to_glazing)+T_fluid*(h_plate_to_fluid)+ T_bottom*(hr_plate_bottom))/(hr_plate_glazing+h_plate_to_glazing+h_plate_to_fluid+ hr_plate_bottom);
	T_bottom			= (hr_plate_bottom*(T_plate)+h_bottom_to_fluid*(T_fluid)+(insulation_conductivity/insulation_thickness)*T_ambient)/(hr_plate_bottom+h_bottom_to_fluid+(insulation_conductivity/insulation_thickness));
	k 				= (2*(air_mass_flow_rate)*C_air)/(width_chamber*length_chamber);
	T_fluid 			= (2*(h_plate_to_fluid*T_plate + h_bottom_to_fluid*T_bottom) + (k-h_plate_to_fluid - h_bottom_to_fluid)*T_fluid)/(h_plate_to_fluid+k+ h_bottom_to_fluid);

end
