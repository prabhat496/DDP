function h_rs = h_rs(sigma, epsilon_g, T_glazing, T_sky, T_ambient)	% Radiative heat transfer coeff b/w glazing and sky
	h_rs = (sigma*epsilon_g*(T_glazing^4 - T_sky^4))/(T_glazing-T_ambient);
end
