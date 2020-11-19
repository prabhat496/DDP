function [T_fluid1, T_plate1, T_glazing1] = collector_iter(T_plate, T_fluid, T_glazing, T_ambient, v_air)

	%	Dimensions

	width_collector 		= 0.05;
	L_collector 			= 0.05;
	gap_bottom_plate 		= 0.05;
	gap_plate_glazing 		= 0.005;

	%	Constants

	sigma				= 5.76*(10^-8);
	g_acc 				= 9.81;
	epsilon_g 			= 0.8;
	epsilon_p 			= 0.95;
	tau_alpha 			= 0.8;
	kin_viscosity       		= 1.81*(10^-5);
	therm_diffusivity 		= 1.9*(10^-5);
	therm_conductivity 		= 0.029;
	C_air 				= 1000;
	rho_air 			= 1.2;


	% 	Few other variables:

	T_sky 				= T_ambient - 7;
	vol_expan_coeff 	= 2/(T_plate+T_glazing);
	S                   = 1000;
	beta 				= pi/6;
	m_flow 				= rho_air*v_air*gap_bottom_plate*width_collector;
	D_hydrolic			= 4*(width_collector)*(gap_bottom_plate)/(2*(width_collector+gap_plate_glazing));
	A              		= L_collector*(width_collector);

	% 	Dimensionless Numbers

	Re                  		= reynolds(v_air, D_hydrolic, kin_viscosity);
	Pr                  		= prandtl(kin_viscosity, therm_diffusivity);
	Ra                  		= rayleigh(g_acc, vol_expan_coeff, T_plate, T_glazing, gap_plate_glazing, kin_viscosity, therm_diffusivity);

	% 	Nusselt's Number:

	Nupf 				= Nu_pf(Re, D_hydrolic, Pr, L_collector);
	Nupg 				= Nu_pg(beta, Ra);

	% 	Heat Transfer coefficients

	hrpg 				= h_rpg(sigma, T_plate, T_glazing, epsilon_p, epsilon_g);
	hrs 				= h_rs(sigma, epsilon_g, T_glazing, T_sky, T_ambient);
	hw              		= 2.8;
	hpf 				= Nupf*(therm_conductivity)/gap_bottom_plate;
	hpg 				= Nupg*(therm_conductivity)/gap_plate_glazing;

	% 	Equivalent Resistances

	Ut 				= 1/(hrs+ hw);
	tau				= 2*(m_flow*(C_air))/(A);	


	Mat_1 				= 	[	-(hpg+hrpg) 	(hpg+hrpg+Ut) 	0;
							(hpg+hrpg+hpf)	-(hpg+hrpg)	-hpf;
							hpf		0		-(hpf+tau)	];
	
	Mat_3				=	[	Ut*(T_ambient); 
							tau_alpha*S; 
							-1*tau*(T_fluid)	];

	
	Mat_2				= inv(Mat_1)*Mat_3;
	% 	New Temperatures:
    T_plate1 = Mat_2(1);
    T_glazing1 = Mat_2(2);
    T_fluid1 = Mat_2(3);
	%T_fluid1 = T_fluid + (tau_alpha*S - (1/(R1+R2))*(T_plate-T_ambient))*A/(2*m_flow*C_air)
	%T_plate1 = T_fluid + R3*(tau_alpha*S - (T_plate-T_ambient)/(R1+R2));
	%T_glazing1 = T_ambient + R1*(T_plate - T_ambient)/(R1+R2); 
    
    if(abs(T_fluid - T_fluid1)<1)
        return;
    end


    [T_fluid1, T_plate1, T_glazing1] = collector_iter(T_plate1, T_fluid1, T_glazing1, T_ambient, v_air);


end

