function Nu_pg = Nu_pg(beta, Ra)		% Nusselt number b/w two parallel plates
	a = (1-((1708*((sin(1.8*beta))^1.6))/(Ra*cos(beta))));
	b = (1-((1708)/(Ra*cos(beta))));
	c = (((Ra*cos(beta))/5830)^(1/3)-1);

	if (b<0)
		b=0;
    end
    
	if (c<0)
		c=0;
	end

	Nu_pg = 1 + 1.44*a*b*c;
end
