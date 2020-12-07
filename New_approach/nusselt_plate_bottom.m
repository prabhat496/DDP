function nusselt_plate_bottom = nusselt_plate_bottom(Re, Pr, Dh, L)

	Nu_inf = 5.4;
	a = 0.0019;
	b = 0.00563;
	m = 1.71;
	n = 1.17;


	if (Re < 5000)
		nusselt_plate_bottom = Nu_inf + ((a*((Re*Pr*(Dh/L))^m))/(1+b*((Re*Pr*(Dh/L))^n)));
	else
		nusselt_plate_bottom = 0.018*(Re^0.8)*(Pr^0.4);
	end
end

