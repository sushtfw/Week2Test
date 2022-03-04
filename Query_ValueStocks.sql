SELECT ARRAY_AGG(DISTINCT (company)) valuestocks 
  FROM ( SELECT company, fiscal_year 
              , LEAD( fiscal_year,1) OVER( PARTITION BY company ORDER BY fiscal_year) fiscal_year_1
              , LEAD( fiscal_year,2) OVER( partition by company ORDER BY fiscal_year) fiscal_year_2               
           FROM dividend
       ) company_sequence
   	WHERE fiscal_year/10000 = fiscal_year_1/10000 - 1 
     AND fiscal_year/10000 = fiscal_year_2/10000 - 2 
   	ORDER BY valuestocks;
	