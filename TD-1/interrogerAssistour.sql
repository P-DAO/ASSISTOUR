\c assistour

SELECT h.* FROM hotel h
INNER JOIN heberger hb 
ON h.numh=hb.numh 
INNER JOIN sinistre s 
ON s.num_s=hb.num_s 
INNER JOIN vehicule v 
ON v.immatriculation=s.immatriculation 
INNER JOIN adherent a 
ON a.numadherent=v.numadherent 
WHERE a.nomadherent = 'IVANOVITCH' AND s.date_s='2020-05-20'
GROUP BY h.numh;

SELECT h.* FROM hotel h
INNER JOIN heberger hb 
ON h.numh=hb.numh 
INNER JOIN sinistre s 
ON s.num_s=hb.num_s 
INNER JOIN vehicule v 
ON v.immatriculation=s.immatriculation 
INNER JOIN adherent a 
ON a.numadherent=v.numadherent 
WHERE a.nomadherent = 'IVANOVITCH' AND s.date_s='2020-05-20'
GROUP BY h.numh;

SELECT r.*, a.nomadherent
FROM rapatriement r
INNER JOIN sinistre s
ON s.num_s = r.num_s
INNER JOIN  vehicule v
ON s.immatriculation = v.immatriculation
INNER JOIN  adherent a
ON a.numadherent = v.numadherent
WHERE a.nomadherent = 'BELKACEM' 
ORDER BY numr;

SELECT sum(cout_r) as cout_rapatriement 
FROM rapatriement r
INNER JOIN sinistre s on r.num_s=s.num_s
INNER JOIN vehicule v
ON v.immatriculation=s.immatriculation
INNER JOIN adherent a 
ON a.numadherent=v.numadherent
WHERE a.nomadherent='BELKACEM' AND s.date_s='2020-03-06';


