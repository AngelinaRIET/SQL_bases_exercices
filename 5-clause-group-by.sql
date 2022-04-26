/* Le prix moyen d'un produit vendu par chaque fournisseur 
triés par prix moyen décroissant */
/* RESULTAT ==> 13 lignes / Welly Diecast Productions / 113.9325 */

SELECT DISTINCT `productVendor`, ROUND(AVG(`buyPrice`), 2) as `avgBuyPrice`
FROM `products`
GROUP BY `productVendor`
ORDER BY `avgBuyPrice`  DESC

/* Le nombre de produits pour chaque ligne de produit */
/* RESULTAT ==> 7 lignes / Classic Cars / 38 */
SELECT DISTINCT `productline`, COUNT(*)
FROM `products`
GROUP BY `productLine`

/* Le total du stock et le total de la valeur du stock à la vente de chaque ligne de produit 
pour les produits vendus plus de 100$ trié par total de la valeur du stock à la vente */
/* RESULTAT ==> 7 lignes / Ships / 429177.74 */

SELECT DISTINCT `productLine`, COUNT(*), SUM(`quantityInStock`), SUM(`quantityInStock`*`MSRP`)
FROM `products`
WHERE `MSRP`> 100
GROUP BY `productLine`


/* La quantité du produit le plus en stock de chaque fournisseur trié par vendeur */
/* RESULTAT ==> 13 lignes / Autoart Studio Design / 9354 */

SELECT DISTINCT `productVendor`, COUNT(*), MAX(`quantityInStock`)
FROM `products`
GROUP BY `productVendor`


/* Le prix de l'avion qui coûte le moins cher à l'achat */
/* RESULTAT ==> 1 ligne / 29.34$ */

SELECT `productLine`, MIN(`buyPrice`)
FROM `products`
WHERE `productLine` = "Planes"


/* Le crédit des clients qui ont payé plus de 20000$ durant l'année 2004 
trié par crédit décroissant */
/* RESULTAT ==> 69 lignes / 141 / 293 765.51 */

SELECT `customerNumber`, ROUND(SUM(`amount`),2) AS `total2004`
FROM `payments` 	 
WHERE `paymentDate` LIKE'2004%'
GROUP BY `customerNumber`
HAVING `total2004`> 20000
ORDER BY `total2004` DESC
