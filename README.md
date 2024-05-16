# TABLEAU DE BORD EMPLOYÉS - PostgreSql+Power Bi
[image](![image](https://github.com/stivinston/Tableau_bord_employes/assets/111785390/4d7a4fc7-38de-47f7-9fa8-fd5e097a6972))
## Contexte
Ce projet vise à nettoyer et à analyser les données des employés d'une organisation afin d'obtenir des informations sur la démographie des employés, les taux de rotation et d'autres informations pertinentes. L'objectif est de fournir des insights précieux aux équipes des ressources humaines et à la direction pour les aider dans les processus de prise de décision liés à la gestion des effectifs et aux stratégies de rétention des employés.
## Objectifs
Les principaux objectifs de ce projet comprennent :

- Analyser la démographie des employés par genre, race, etc.
- Identifier les tendances dans les taux de rotation des employés sur une période de 20 ans.
- Nettoyer et préparer le jeu de données pour l'analyse.
- Créer des visualisations pour présenter les principales conclusions et insights.
## Source de Données
Le jeu de données utilisé dans ce projet a été obtenu auprès de [dataset](https://github.com/stivinston/Tableau_bord_employes/blob/main/Human%20Resources.csv) et contient des informations sur les employés, y compris leurs détails démographiques,  leurs dates de cessation d'emploi.
Column | Definition
--- | -----------
id |  Identifiant unique pour chaque enregistrement.
first_name | Prénom de l'employé.
last_name | Nom de famille de l'employé.
birthdate | Date de naissance de l'employé.
gender | Sexe de l'employé
race |  Race ou origine ethnique de l'employé.
department |  Département dans lequel travaille l'employé.
jobtitle |  Intitulé du poste occupé par l'employé.
location |  Emplacement physique où l'employé travaille.
hire_date | Date d'embauche de l'employé.
termdate | Date de cessation d'emploi de l'employé.
location_city | Ville où se trouve l'emplacement de travail de l'employé.
location_state | État ou région où se trouve l'emplacement de travail de l'employé.

`Human Ressources.csv` contient 22214 enregistrements
## Étapes de Réalisation du Projet
<b>1. Importation du fichier .csv dans ma base de donnée PostgreSQL</b><br>
<b>2. Nettoyage des données :</b> En corrigeant les incohérences et en standardisant les formats<br>
<b>3. Analyse des Données :</b> Réalisation d'une analyse exploratoire des données en répondant à des questions spécifiques pour obtenir des insights les employés<br>
<b>4. Visualisation : </b> Création de visualisations à l'aide de Power BI Desktop pour présenter efficacement les résultats.<br>
<b>5. Génération de Rapports :</b> Préparation d'un rapport résumant l'analyse et les principales conclusions.<br>

## Résumé
- Il y'a plus d'employé Homme que de femme, mais la différence est négligeable.
- La race blanche est plus dominante tandis que les américains indiens et les hawaiens sont moins dominants
- 05 tranches d'âge ont été crée inférieur à 25, 25-34, 35-44, 45-54, 55 et plus. le nombre d'employés des groupes de 25-34, 35-44, 45-54 sont identiques et les plus nombreux tandisque celui des groupes de inférieur à 25, 55 et plus sont également identiques mais très peu représenté
- Il y'a plus d'employé travaillant sur site que ceux travaillant en remote
- la durée moyenne de cette organisation est d'environ 10 ans
- La distribution du sexe par rapport aux différents département est très peu contreversé mais les Hommes ont tendances à être plus nombreux
- Research assistant II est la fonction ayant le plus de personnes
- Auditing est le département ayant le taux de cessation d'emploie le plus élévé
- Le nombre d'employé au fil des années est plutôt constant
- L'Etat de OHIO est celui ayant le plus grand nombre d'employé
