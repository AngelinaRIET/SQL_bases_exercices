/* La liste des employés (nom, prénom et fonction) et des bureaux (adresse et ville) dans lequel ils travaillent */
/* RESULTAT ==> 23 lignes / Diane Murphy */
SELECT `lastName`,`firstName`,`jobTitle`, `offices`.`addressLine1`,`offices`.`addressLine2`,`offices`.`city`,`offices`.`postalCode`
FROM `employees` 
JOIN `offices` 
ON `employees`.`officeCode`=`offices`.`officeCode`


/* La liste des clients français ou américains (nom du client, nom, prénom du contact et pays) 
et de leur commercial dédié (nom et prénom) triés par nom et prénom du contact */
/* RESULTAT ==> 48 lignes / Miguel Barajas */

SELECT `customerName`,`contactLastName`,`contactFirstName`,`country`, `employees`.`lastName`,`employees`.`firstName`
FROM `customers`
JOIN `employees` 
ON `customers`.`salesRepEmployeeNumber`= `employees`.`employeeNumber`
WHERE `customers`.`country`="France" 
OR `customers`.`country`="USA"
ORDER BY `contactLastName`,`contactFirstName`

/* La liste des lignes de commande (numéro de commande, code, nom et ligne de produit) 
et la remise appliquée aux voitures ou motos commandées triées par numéro de commande puis par remise décroissante */
/* RESULTAT ==> 2026 lignes / 34 */
SELECT `orderNumber`,`products`.`productCode`,`products`.`productName`, `products`.`productline`, ROUND(`products`.`MSRP`-`priceEach`,2) 
AS 'remise'
FROM `orderdetails`
JOIN `products`	
ON `orderdetails`.`productCode`=`products`.`productCode`
WHERE `productline`="Motorcycles" 
OR `productline` 
LIKE "%Cars%"
ORDER BY `products`.`productLine`ASC