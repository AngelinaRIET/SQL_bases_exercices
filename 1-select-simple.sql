/* La liste des bureaux (adresse et ville) triés par pays décroissant puis par état */
/* RESULTAT ==> 7 lignes / 100 Market Street */

SELECT `addressLine1`, `addressLine2`, `postalCode`, `city` 
FROM `offices`
ORDER by `country` DESC, `state`