function nusselt_plate_glazing = nusselt_plate_glazing(Ra, beta)

	a = 1 - 1708/(Ra*cos(beta));
	b = 1 - (1708*((sin(1.8*beta))^1.6))/(Ra*cos(beta));
	c = ((Ra*cos(beta))^(1/3))/18 - 1;

	if (a<0)
		a = 0;
	end

	if (c<0)
		c = 0;
	end

	nusselt_plate_glazing = 1 + 1.44*a*b + c;
end
