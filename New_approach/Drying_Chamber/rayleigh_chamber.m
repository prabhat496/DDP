function rayleigh_collector = rayleigh_collector(T1, T2, L, kinematic_viscosity, Pr)

	g = 9.81;
	beta_dash = 2/(T1+T2);

	Tmax = T1;
	Tmin = T2;

	num = g*beta_dash*(Tmax - Tmin)*(L^3)*Pr;
	den = kinematic_viscosity^2;

	rayleigh_collector = num/den;
end
