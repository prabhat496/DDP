function h_rpg = h_rpg(sigma, T_plate, T_glazing, epsilon_p, epsilon_g)		% Radiative heat transfer b/w plate and glazing

	h_rpg = (sigma*(T_plate^2 + T_glazing^2)*(T_plate + T_glazing))/((1/epsilon_g)+(1/epsilon_p)-1);

end
