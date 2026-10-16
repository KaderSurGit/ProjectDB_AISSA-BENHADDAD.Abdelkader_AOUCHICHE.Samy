# Mini-projet TI503N – Base de données (Partie 1)

**Binôme :** Abdelkader AISSA BENHADDAD – Samy AOUCHICHE
**Domaine :** mode de luxe et haute couture (comme Louis Vuitton, Hermès, Dior)

## 1. Étape 1 : Analyse des besoins

### 1.1 Prompt utilisé

```text
Tu travailles dans le domaine de la mode de luxe et de la haute couture. Ton entreprise a comme activité de concevoir, fabriquer et vendre de la maroquinerie haut de gamme, de la joaillerie sur mesure et des collections exclusives de prêt-à-porter. C'est une entreprise comme Louis Vuitton, Hermès ou Dior. Nous avons collecté des données concernant : nos boutiques internationales, nos artisans hautement qualifiés (y compris les relations de mentorat entre artisans maîtres et artisans juniors), les profils de notre clientèle VIP, les commandes sur mesure complexes (qui impliquent toujours un client précis, une boutique dédiée et un artisan assigné) et les éditions limitées de nos produits. Inspire-toi du site web suivant : la présentation du groupe LVMH (https://www.lvmh.com/group/), ainsi que des connaissances générales sur les services sur mesure et le savoir-faire artisanal d'Hermès.
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
D'abord, établis les règles de gestion des données de ton entreprise, sous la forme d'une liste à puces. Elle doit correspondre aux informations que fournit quelqu'un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information.
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données.
```

### 1.2 Règles de gestion obtenues

**Nos boutiques et notre réseau**

- Nous exploitons un réseau de boutiques internationales. Chaque boutique est identifiée par un code unique, un nom et sa localisation (ville et pays).
- Chaque boutique a un niveau de prestige précis (par exemple : Flagship, Pop-up, Historique) et un numéro de téléphone principal.

**Nos artisans et la transmission (relation récursive)**

- Chaque artisan est identifié par un identifiant employé unique. Nous enregistrons son prénom, son nom, sa spécialité artisanale (par exemple : maroquinerie, sertissage) et sa date d'embauche.
- La transmission du savoir-faire est essentielle : un artisan « Junior » doit être encadré par un artisan « Maître ».
- Un « Maître » peut encadrer plusieurs juniors, mais un junior n'a qu'un seul mentor actif à la fois. Cela constitue une hiérarchie interne stricte.

**Notre clientèle VIP (entité forte)**

- Nos clients sont des membres exclusifs identifiés par un numéro d'adhésion VIP unique.
- Nous conservons leurs informations personnelles (prénom, nom), leurs coordonnées (e-mail, téléphone), leur langue préférée et leur niveau de dépenses cumulées (par exemple : Platine, Diamant).

**Les commandes sur mesure (entité faible)**

- Le « sur mesure » est notre service ultra-personnalisé. Pour préserver la confidentialité et l'exclusivité des clients, nous n'utilisons pas de numéro de commande global.
- Règle spécifique : une commande sur mesure est identifiée par un numéro séquentiel propre au dossier du client (par exemple : 1ʳᵉ commande du client X, 2ᵉ commande du client X). Une commande ne peut donc pas exister sans être rattachée à un client VIP.
- Chaque commande a une date de création, une date de livraison estimée, un prix final négocié et un statut de production.
- Une commande est toujours gérée par exactement une boutique et réalisée par exactement un artisan principal.

**Les produits en édition limitée**

- Nous créons des produits rares (sacs à main, montres) identifiés par une référence unique.
- Chaque produit a un nom, une catégorie, une description de matière, un prix catalogue et une limite de production stricte (par exemple : 50 pièces maximum dans le monde).

### 1.3 Dictionnaire de données obtenu

| Signification de la donnée | Type | Taille (caractères / chiffres) |
|---|---|---|
| **BOUTIQUE** | | |
| Code unique de la boutique (`boutique_code`) | Alphanumérique | 10 |
| Nom de la boutique (`boutique_name`) | Alphanumérique | 50 |
| Ville de la boutique (`boutique_city`) | Alphanumérique | 50 |
| Pays de la boutique (`boutique_country`) | Alphanumérique | 50 |
| Niveau de prestige de la boutique (`Boutique_prestige_tier_classification`) | Alphanumérique | 20 |
| Numéro de téléphone de la boutique (`boutique_phone`) | Alphanumérique | 20 |
| **ARTISAN** | | |
| Identifiant employé de l'artisan (`Artisan_ID`) | Alphanumérique | 10 |
| Prénom de l'artisan (`Artisan_First_Name`) | Alphanumérique | 50 |
| Nom de l'artisan (`Artisan_Last_Name`) | Alphanumérique | 50 |
| Spécialité artisanale (`Craft_Specialty`) | Alphanumérique | 40 |
| Date d'embauche (`Hire_Date`) | Date | 10 |
| Date de début du mentorat (`Mentorship_Start_Date`) | Date | 10 |
| **CLIENT_VIP** | | |
| Numéro d'adhésion VIP (`VIP_Number`) | Alphanumérique | 15 |
| Prénom du client (`Client_First_Name`) | Alphanumérique | 50 |
| Nom du client (`Client_Last_Name`) | Alphanumérique | 50 |
| Adresse e-mail du client (`Client_Email`) | Alphanumérique | 100 |
| Numéro de téléphone du client (`Client_Phone`) | Alphanumérique | 20 |
| Langue préférée (`Preferred_Language`) | Alphanumérique | 20 |
| Niveau de dépenses cumulées (`Spend_Tier`) | Alphanumérique | 30 |
| **LIMITED_PRODUCT** | | |
| Référence du produit (`Product_Reference`) | Alphanumérique | 15 |
| Nom du produit (`Product_Name`) | Alphanumérique | 100 |
| Catégorie du produit (`Product_Category`) | Alphanumérique | 30 |
| Description de la matière principale (`Material_Description`) | Alphanumérique | 200 |
| Limite de production, quantité max (`Production_Limit`) | Numérique | 4 |
| Prix catalogue en euros (`Catalog_Price`) | Numérique | 8 |
| **BESPOKE_ORDER** | | |
| Numéro séquentiel de la commande : 01, 02… (`Order_Sequential_Num`) | Numérique | 3 |
| Date de création de la commande (`Order_Date`) | Date | 10 |
| Date de livraison estimée (`Estimated_Date`) | Date | 10 |
| Prix final négocié (`Final_Price`) | Numérique | 9 |
| Statut de production (`Production_Status`) | Alphanumérique | 30 |
| Description de la demande spéciale (`Client_Request_Notes`) | Alphanumérique | 500 |

Total : 31 données.

## 2. Étape 2 : MCD


Fichier source : `MCD_AISSA-BENHADDAD_AOUCHICHE.loo`

**Entités :** `BOUTIQUE`, `ARTISAN`, `CLIENT_VIP`, `LIMITED_PRODUCT`, `BESPOKE_ORDER`
**Associations :** `PLACE`, `MANAGE`, `CRAFT`, `MENTOR`, `STOCK`, `PURCHASE`

**Éléments de modélisation avancée :**

- **Association récursive :** `MENTOR` sur `ARTISAN`. Un junior a au plus un mentor (0,1), un master peut en encadrer plusieurs (0,n). `Mentorship_Start_Date` est portée par l'association.
- **Entité faible :** `BESPOKE_ORDER`, identifiée par `Order_Sequential_Num` relativement à `CLIENT_VIP` via l'association `PLACE` (1,1)(R).
- **Entité forte :** `CLIENT_VIP`, identifiée par `VIP_Number`.

**Données ajoutées au dictionnaire :** `Years_Experience` et `Workshop_Location` (dans `ARTISAN`), `Stock_Quantity` (dans `STOCK`), `Purchase_Date` et `Purchase_Quantity` (dans `PURCHASE`).
