# Cinema-Base de données

/*CREATION DUNE BASE DE DONNEES SQL pour une entreprise Fictive de cinéma.*/

Contexte : le Cinema dispose de plusieurs complexes et salles. 
Plusieurs admins doivent avoir tous les droits sur cette BDD. 
Un Utilisateur peut exprimer le choix d'une seance dans son cinema Favori.
Un film est projeté parfois dans plusieurs salles et dans le même cinema en même temps.
il y a Trois tarifs; adults, étudiants et enfant.
Il y a deux moyens de paiement: sur place et en ligne.

/*CROQUIS + EXCALIDRAW */
1 J’ai dessiné un croquis, à la main d’un Modèle de conception de Relation de Base de Données, en lien avec le sujet transmis sur le Cinéma et ses conditions.
J’ai utilisé la méthode Merise pour la conception de celui-ci, qui est une base de données relationnelles, les liens de cardinalités et les relations entre tables,
les contraintes entre les clés primaires et secondaires.
Puis j’ai reproduit ce croquis à la main sur le site et logiciel EXCALIDRAW pour un rendu final.
Sauvegarde en PNG du document.

/*MODELISATION DE MON SHEMA MCD, MERISE EN SQL*/

Pour créer une base de données, j’ai commencé à travailler sur Visual Studio Code.
J’ai créé un fichier index. SQL.
En parallèle, J'ai installé MySQL sur mon terminal pour tester, plusieurs fonctionnalités en réelles.
Php My Admin était déjà installé via XAMPP.
Cela me permet de vérifier si des morceaux de code sont valides et sans faute de syntaxe, comme nous l’a conseillé JB LAVISSE, dans son Live.
J’ai commencé ma base de données, en créant une base de données cinemaChristine, puis j’ai ajouté toutes mes tables, en commençant avec 
la table Utilisateurs qui n’a pas de Foreign Key.
J’ai ajouté sur chaque table le lien de relation et de cardinalité en ajoutant des clefs secondaires, FOREIGN KEY et les contraintes à chacune des tables.
Pour remplir les tables Utilisateurs, séances, Admin, etc...

J’ai utilisé le site Mockaroo.com pour avoir plusieurs noms, adresse et mot de passes.
J’ai utilisé le site bcrypt.fr, pour crypter ou Hasher les mots de passes recueillis pour plus de sécurité.
La fonction ENGINE=InnoDB a été ajouté à chacune des tables pour sécuriser toutes les données.
Pour les Admins, j’ai utilisé la fonction GRANT ALL PRIVILEGES avec ladresse IP qui me parait plus fiable, en termes de sécurité sur les droits des admins.

Pour les Utilisateurs, j’ai utilisé un SELECT DISTINCT FROM ORDER BY, pour récupérer un utilisateur par complexe et avec le choix de sa séance dans son cinéma favoris.
Avec cette information, les Admins pourront exécuter le choix d’un utilisateur, par complexe pour une séance.
Je préfère pour des notions de sécurités, que ce soit les Admins qui ont le droit d’ajouter et supprimer les séances.
J’ai vérifié des morceaux de code dans PhpMyAdmin, pour vérifier les erreurs de syntaxe et si le code SQL est valide sur toute la base de données. Le code est ok.

/*SAUVEGARDE ET RECUPERATION BASE DE DONNEES*/

Pour Exporter ,sauvegarder , et importer ma base de données , j’utilise MysqlDump intégré à MySQl.
