# Wiim Integration

Plugin Lyrion (LMS) pour les lecteurs WiiM. Il permet de sélectionner l'est entrées et sorties, de configurer les préréglages directement de Lyrion, de surveiller la lecture du Wiim et de la contrôler, ainsi que la redistribution audio DLNA vers d’autres platines Lyrion comme récepteur DNLA-renderer.

Ce plugin permet donc d'enrichir la platine Wiim avec une intégration poussée, permettant de transformer une platine Wiim en platine qui a des capacités et une intégration au niveau des appareils Squeezebox.  

Version 1.0.49.

## Dépôt pour Lyrion

Dans Réglages, Greffons, dépôts supplémentaires :

https://raw.githubusercontent.com/jsarcand/WiimIntegration/main/repo.xml

## Installation

Copier ce dossier dans les plugins du serveur, sous le nom `WiimIntegration` :

`Cache/InstalledPlugins/Plugins/WiimIntegration`

Le serveur doit être redémarré pour charger le plugin. Les fichiers `custom-types.conf` et `custom-convert.conf` déclarent le type `wrel`, qui sert le flux sans le faire passer par un transcodeur.

## Relais de Diffusion

Pour activer le relais de diffusion à partir du Wiim, il faut configurer la sortie dans un appareil compatible: il faut connecter Wiim au serveur musical Lyrion. Le rendu DLNA s’appelle « nom du serveur - Lyrion Music Server ». Le nom vient du réglage LMS, sinon du nom de la bibliothèque, sinon du nom d’hôte.
Après cette étape réalisée, Lyrion Music Server reçoit le flux audio du WiiM, puis le joue sur les platines qui en font la demande. Le schéma de lecture est `wiimrelay://` suivi de l’adresse MAC du WiiM, en minuscules

Dans le menu **Sortie** de la platine WiiM (accessible dans les extras/Itégaration WIIM) chaque autre platine Lyrion apparaît sur une ligne « Vers … ». Les platines groupées sont à la fin. La coche n’est posée que pendant que cette platine joue vraiment ce flux. Une préférence enregistrée, ou une file en pause, ne coche pas la ligne. Le trait entre les sorties du WiiM et les platines Lyrion appartient au thème Material, pas à ce plugin.

Commandes :

- `wiimintegration diffuse <mac>` démarre la diffusion vers cette platine. Si elle joue déjà le flux, la même commande le retire de sa file.
- `wiimintegration diffusereset` retire le flux `wiimrelay://` des files, efface les cibles, et remet l’entrée du WiiM sur celle notée au début (Bluetooth, Line In, Optical, HDMI ou Wi-Fi) si elle a changé. Spotify, AirPlay et TIDAL n’ont pas de commande de retour. Le reset retire quand même le flux des files.

La barre de lecture Material peut afficher cet état à partir du champ `wiim_diffuse` renvoyé par `status`. Cet affichage appartient au thème, pas à ce plugin.

## Notes d'usage
En ce moment, le pairage doit être fait sur l'application Wiim à chaque fois qu'on désire utiliser cette fonction.  Le pairage ne résiste pas au changement de sorties sur le wiim. 
Dans les préréglages, les entrées Spotify et TIDAL configurées sur le Wiim sont bloquées dans l'interface pour éviter de les écraser avec une réorganisation des préréglages.  On peut cependant les effacer, puis les configurer comme préréglage Lyrion.
