# Wiim Integration

Lyrion (LMS) plugin for WiiM players. It selects inputs and outputs, configures presets from Lyrion, watches WiiM playback (including metadata retrieval) and controls it, and redistributes that audio over DLNA to other Lyrion players through a DLNA renderer.

The plugin gives a WiiM player a deeper place in Lyrion, closer to the capabilities and integration of a Squeezebox.

Version 1.0.49.

[Lire en français](#français)

## Lyrion repository

In Settings → Plugins → additional repositories, add:

https://raw.githubusercontent.com/jsarcand/WiimIntegration/main/repo.xml

## Installation

Copy this folder into the server’s plugins, under the name `WiimIntegration`:

`Cache/InstalledPlugins/Plugins/WiimIntegration`

Restart the server so it loads the plugin. `custom-types.conf` and `custom-convert.conf` declare the `wrel` type, which serves the stream without sending it through a transcoder.

## Diffusion relay

To start the relay from a WiiM, point a compatible output at Lyrion: connect the WiiM to the Lyrion music server. The DLNA renderer is named “server name - Lyrion Music Server”. The name comes from the LMS server setting, otherwise the library name, otherwise the host name.

After that step, Lyrion Music Server receives the WiiM audio stream and plays it on the players that ask for it. The play scheme is `wiimrelay://` followed by the WiiM MAC address, in lowercase.

In the WiiM player’s **Output** menu (Extras / Wiim Integration), each other Lyrion player appears on a “Vers …” row. Grouped players are listed at the end. The check mark is set only while that player is actually playing this stream. A saved preference, or a paused queue, does not check the row. The divider between the WiiM outputs and the Lyrion players belongs to the Material theme, not to this plugin.

Commands:

- `wiimintegration diffuse <mac>` starts diffusion to that player. If the player is already playing the stream, the same command removes it from the queue.
- `wiimintegration diffusereset` removes `wiimrelay://` tracks from the queues, clears the targets, and restores the WiiM input to the one noted at the start (Bluetooth, Line In, Optical, HDMI, or Wi-Fi) when that input has changed. Spotify, AirPlay, and TIDAL have no return command. Reset still removes the stream from the queues.

The Material now-playing bar can show this state from the `wiim_diffuse` field returned by `status`. That display belongs to the theme, not to this plugin.

## Usage notes

Pairing still has to be done in the WiiM app each time this function is used. Pairing does not survive an output change on the WiiM.

Spotify and TIDAL inputs configured on the WiiM are locked in the preset list, so reordering presets does not overwrite them. They can be deleted, then set up again as a Lyrion preset.

---

## Français

Plugin Lyrion (LMS) pour les lecteurs WiiM. Il permet de sélectionner les entrées et les sorties, de configurer les préréglages depuis Lyrion, de surveiller la lecture du WiiM (y compris la récupération des métadonnées) et de contrôler la lecture, ainsi que de redistribuer l’audio en DLNA vers d’autres platines Lyrion, par un récepteur DLNA (renderer).

Le plugin enrichit la platine WiiM d’une intégration poussée, pour lui donner des capacités et une place dans Lyrion au niveau d’un appareil Squeezebox.

Version 1.0.49.

[Read in English](#wiim-integration)

### Dépôt pour Lyrion

Dans Réglages → Greffons → dépôts supplémentaires :

https://raw.githubusercontent.com/jsarcand/WiimIntegration/main/repo.xml

### Installation

Copier ce dossier dans les plugins du serveur, sous le nom `WiimIntegration` :

`Cache/InstalledPlugins/Plugins/WiimIntegration`

Le serveur doit être redémarré pour charger le plugin. Les fichiers `custom-types.conf` et `custom-convert.conf` déclarent le type `wrel`, qui sert le flux sans le faire passer par un transcodeur.

### Relais de diffusion

Pour activer le relais à partir du WiiM, il faut envoyer la sortie vers un appareil compatible : connecter le WiiM au serveur musical Lyrion. Le rendu DLNA s’appelle « nom du serveur - Lyrion Music Server ». Le nom vient du réglage LMS, sinon du nom de la bibliothèque, sinon du nom d’hôte.

Une fois cette étape faite, Lyrion Music Server reçoit le flux audio du WiiM, puis le joue sur les platines qui en font la demande. Le schéma de lecture est `wiimrelay://` suivi de l’adresse MAC du WiiM, en minuscules.

Dans le menu **Sortie** de la platine WiiM (Extras / Intégration WiiM), chaque autre platine Lyrion apparaît sur une ligne « Vers … ». Les platines groupées sont à la fin. La coche n’est posée que pendant que cette platine joue vraiment ce flux. Une préférence enregistrée, ou une file en pause, ne coche pas la ligne. Le trait entre les sorties du WiiM et les platines Lyrion appartient au thème Material, pas à ce plugin.

Commandes :

- `wiimintegration diffuse <mac>` démarre la diffusion vers cette platine. Si elle joue déjà le flux, la même commande le retire de sa file.
- `wiimintegration diffusereset` retire le flux `wiimrelay://` des files, efface les cibles, et remet l’entrée du WiiM sur celle notée au début (Bluetooth, Line In, Optical, HDMI ou Wi-Fi) si elle a changé. Spotify, AirPlay et TIDAL n’ont pas de commande de retour. Le reset retire quand même le flux des files.

La barre de lecture Material peut afficher cet état à partir du champ `wiim_diffuse` renvoyé par `status`. Cet affichage appartient au thème, pas à ce plugin.

### Notes d’usage

Pour l’instant, le pairage doit être fait dans l’application WiiM chaque fois qu’on veut utiliser cette fonction. Le pairage ne résiste pas à un changement de sortie sur le WiiM.

Dans les préréglages, les entrées Spotify et TIDAL configurées sur le WiiM sont verrouillées dans l’interface, pour éviter qu’une réorganisation des préréglages les écrase. On peut toutefois les effacer, puis les configurer comme préréglage Lyrion.
