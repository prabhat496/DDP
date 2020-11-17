function h_rpg = h_rpg(sigma, T_plate, T_glazing, epsilon_p, epsilon_g)		% Radiative heat transfer b/w plate and glazing

	h_rpg = sigma*(T_plate^4 - T_plate^4)/((1/epsilon_g)+(1/epsilon_p)-1)*(T_plate - T_glazing)

end
