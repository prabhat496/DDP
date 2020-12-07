function fD = colebrook(roughness, Re, D_hydrolic)

	fD 	= 64/Re;

	fD1 	= 0.25/((log10(((roughness/D)/3.7)+(2.51/(Re*sqrt(fD)))))^2);

	while (abs((fD1-fD)/fD)<0.001)

		fD	= fD1;

		fD1 	= 0.25/((log10(((roughness/D)/3.7)+(2.51/(Re*sqrt(fD)))))^2);
	end
