# Administration BDD

## Liens utiles

* [SQLServer TSQL CheatSheet](https://www.petefreitag.com/cheatsheets/sqlserver/)
* [Date format](https://tableplus.io/blog/2018/09/sql-server-date-format-cheatsheet.html)
* [mssql-cli usage guide](https://github.com/dbcli/mssql-cli/blob/master/doc/usage_guide.md)

## Atelier 2.1

1.

```
SELECT * FROM employes;
```

2.

```
SELECT * FROM categories;
```

3.

```
SELECT nom,prenom,date_naissance,commision FROM employes;
```

4.

```
SELECT distinct fonction FROM employes;
```

5.

```
SELECT distinct pays FROM clients;
```

6.

```
SELECT distinct ville FROM clients;
```

## Atelier 2.2

1.

```
SELECT nom_produit, CONCAT(unites_stock * CONVERT(float, prix_unitaire), '€') AS 'Valeur du stock' 
FROM produits;
```

2.

```
SELECT nom, prenom,
       DATEDIFF(year, date_naissance, getdate()) AS Age,
       DATEDIFF(year, date_embauche, getdate()) AS Anciennete
FROM employes;
```

3.

```
SELECT nom AS Employe, 'gagne' AS 'a un', CONVERT(float, salaire)*12 AS 'gain annuel', 'par an.' AS 'sur 12 mois'
FROM employes;
```

## Atelier 2.3


1.

```
SELECT societe, pays FROM clients WHERE ville = 'Toulouse';
```

2.

```
SELECT nom, prenom FROM employes WHERE rend_compte = 2;
```

3.

```
SELECT nom, prenom, fonction FROM employes WHERE fonction != 'Représentant(e)';
```

4.

```
SELECT nom, prenom, fonction FROM employes WHERE convert(float, salaire) < 3500;
```

5.

```
SELECT societe, ville, pays FROM clients WHERE fax = '';
```

6.

```
SELECT nom, prenom, fonction FROM employes WHERE rend_compte = no_employe;
```

## Atelier 2.4

1.

```
SELECT nom FROM employes ORDER BY nom desc;
```

2.

```
SELECT societe, pays FROM clients ORDER BY pays;
```

3.

```
SELECT societe, ville, pays FROM clients ORDER BY pays, ville;
```

## Atelier 2.5

1.

```
SELECT nom, prenom, fonction, salaire
FROM employes WHERE CONVERT(float, salaire)
BETWEEN 2500 AND 3500;
```

2.

```
SELECT nom_produit, fournisseurs.societe, categories.nom_categorie, quantite
FROM produits
JOIN fournisseurs ON produits.no_fournisseur = fournisseurs.no_fournisseur
JOIN categories ON produits.code_categorie = categories.code_categorie
WHERE produits.code_categorie NOT IN (1,3,5,7);
```

3.

```
SELECT nom_produit, fournisseurs.societe, categories.nom_categorie, quantite
FROM produits
JOIN fournisseurs ON produits.no_fournisseur = fournisseurs.no_fournisseur
JOIN categories ON produits.code_categorie = categories.code_categorie
WHERE produits.no_fournisseur BETWEEN 1 AND 3
AND produits.code_categorie BETWEEN 1 AND 3
AND quantite LIKE '%boîtes%'
OR quantite LIKE '%cartons%';
```

4.

```
SELECT nom
FROM employes
JOIN commandes ON commandes.no_employe = employes.no_employe
JOIN clients ON clients.code_client = commandes.code_client
WHERE clients.ville = 'Paris'
GROUP BY nom
HAVING COUNT(commandes.code_client) > 0;
```

5.

```
SELECT nom_produit, fournisseurs.societe
FROM produits
JOIN fournisseurs ON produits.no_fournisseur = fournisseurs.no_fournisseur
WHERE code_categorie IN (1,4,7);
```

6.

```
SELECT emp.nom, sup.nom
FROM employes AS emp
JOIN employes AS sup ON emp.no_employe = sup.rend_compte;
```
