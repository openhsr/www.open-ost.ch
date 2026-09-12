---
title: WLAN
---
## Technische Angaben

Einstellung | Wert
----------- | ----
SSID | ```eduroam```
Security | ```WPA & WPA2 Enterprise```
Authentication | ```Protected EAP (PEAP)```
PEAP version | ```Automatic```
CA Zertifikat | ```ca-certificates.crt```
Inner authentication | ```MSCHAPv2```
Username | ```maria.muster```
Password | ```GeHeim007```


{% toggle %}
## Zertifikat

Sofern der Netzwerk-Manager nicht automatisch ein Zertifikat auswählt muss dies manuell ausgewählt werden.
Das Zertifikat wird unter ```/etc/ssl/certs/ca-certificates.crt``` gefunden.

## WLAN unter Ubuntu / Gnome Desktop einrichten

1. **Netzwerk auswählen**<br>
	Wähle unter den verfügbaren Wifi-Netzwerken ```eduroam``` aus.
	{% lightbox /assets/hsr/wlan/wlan_select-ssid.png --data="wlan ubuntu" --title="Auswählen des WLAN-Netzwerkes" --alt="Wifi-Netzwerk eduroam" %}

2. **Wifi Netzwerk Authentifikation**<br>

	Wähle folgende Einstellungen für die Authentifikation des Netzwerkes:
	{% lightbox /assets/hsr/wlan/wlan_authentication.png --data="wlan ubuntu" --title="Einstellungen Authentication" --alt="Wifi-Netzwerk eduroam Authentifikation" %}

3. Die Meldung des fehlenden Zertifikates kann ignoriert werden.
4. Du bist nun verbunden! :tada:
	{% lightbox /assets/hsr/wlan/wlan_connected.png --data="wlan ubuntu" --title="Erfolgreich verbunden" --alt="Wifi-Netzwerk eduroam Connected" %}

## Bug in älteren Linux Mint Versionen

Die oben beschriebene Vorgehensweise in Kombination mit der Sicherheitsstufe "WPA & WPA2 Enterprise" funktioniert unter Linux Mint nicht: Es erscheint keine Abfrage, um die nötigen Informationen wie Sicherheitsstufe, Username und Passwort einzugeben. Lösung: In ein verborgenes Netzwerk einwählen (Hidden Network). 

1. Im Startmenü "Netzwerk" eingeben, der Netzwerk-Manager erscheint:

	{% lightbox /assets/hsr/wlan/lm_networkmanager.png --data="wlan lm" --title="Network Manager von Linux Mint" --alt="Network Manager Linux Mint" %}

2. Klicke auf ```Mit einem verborgenem Netzwerk verbinden```. Wähle im Dropdown-Menü von ```Security``` die Sicherheitsstufe "WPA & WPA2 Enterprise" aus. 

3. Einstellungen für die Netzwerk-Authentifikation, Reiter "Wi-Fi": Schreibe unter SSID den Namen des Netzwerkes, mit dem du dich verbinden willst, also ```eduroam```.<br> Reiter "Wifi-Security": Hier folgen alle weiteren Angaben wie in der Anleitung oben, nach Schritt 2.

	{% lightbox /assets/hsr/wlan/lm_hiddennetwork.png --data="wlan lm" --title="Hidden Network: OST-Secure" --alt="Hidden Network OST-Secure" %}

{% endtoggle %}
