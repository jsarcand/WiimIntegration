# Wiim Integration

Plugin Lyrion pour les lecteurs WiiM. Il reprend les sources, les préréglages, les métadonnées des entrées externes, et la redistribution DLNA vers d’autres platines Lyrion.

Version 1.0.48.

## Installation

Copier ce dossier dans les plugins du serveur, sous le nom `WiimIntegration` :

`Cache/InstalledPlugins/Plugins/WiimIntegration`

Le serveur doit être redémarré pour charger le plugin. Les fichiers `custom-types.conf` et `custom-convert.conf` déclarent le type `wrel`, qui sert le flux sans le faire passer par un transcodeur.

## Diffusion

Le rendu DLNA s’appelle « Lyrion Diffusion ». Il reçoit le flux HTTP du WiiM, puis le joue sur les platines choisies. Le schéma de lecture est `wiimrelay://` suivi de l’adresse MAC du WiiM, en minuscules.

Dans le menu **Sortie** de la platine WiiM, chaque autre platine Lyrion apparaît sur une ligne « Vers … ». La coche n’est posée que pendant que cette platine joue vraiment ce flux. Une préférence enregistrée, ou une file en pause, ne coche pas la ligne.

Commandes :

- `wiimintegration diffuse <mac>` démarre la diffusion vers cette platine. Si elle joue déjà le flux, la même commande le retire de sa file.
- `wiimintegration diffusereset` retire le flux `wiimrelay://` des files, efface les cibles, et remet l’entrée du WiiM sur celle notée au début (Bluetooth, Line In, Optical, HDMI ou Wi-Fi) si elle a changé.

Spotify, AirPlay et TIDAL n’ont pas de commande de retour. Le reset retire quand même le flux des files.

La barre de lecture Material peut afficher cet état à partir du champ `wiim_diffuse` renvoyé par `status`. Cet affichage appartient au thème, pas à ce plugin.
