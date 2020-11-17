function R_ga = R_ga(h_rs, h_wind)	% Function to find the thermal resistance b/w glazing and ambient
	R_ga  = 1/(h_rs+h_wind);
end
