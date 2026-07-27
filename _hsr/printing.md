---
title: Drucken
---

## E-Mail mit PDF im Anhang

Drucken per E-Mail ist die einfachste und bequemste Variante, um von Linux aus deine Dokumente zu drucken.

1. Öffne dein E-Mail Programm und erstelle eine neue E-Mail.
2. Stell sicher, dass du deine OST-E-Mail als Absender verwendest.
2. Tippe als Empfänger die Adresse `mobileprint.rj@ost.ch` ein.
3. Hänge eine oder mehr PDF-Dokumente an.
4. Sende die E-Mail ab (Betreff und Inhalt braucht es nicht). <br>
5. Kurze Zeit später solltest du eine Bestätigungsemail erhalten.
6. Geh zu einem der Canon-Multifunktionsgeräte und leg deinen Badge auf.
7. Unter `Secure Print` taucht der Druckauftrag auf. Du kannst Einstellungen wie lochen, heften, Duplex, Farbe usw. setzen, indem du den Auftrag auswählst und dann auf `Optionen` drückst.
8. Drücke auf `drucken & löschen` - der Auftrag wird nun gedruckt.

### Hinweise

* Stelle sicher, dass deine E-Mail nach dem Muster `vorname.nachname@ost.ch` eingerichtet ist. Wenn deine E-Mail das Kürzel (wie `mmuster`) verwendet, funktioniert der Druck nicht.
* Die Standardeinstellung für alle E-Mail-Druckaufträge ist schwarz-weiss. Dies kann am Drucker
direkt unter `Optionen`  auf `Farbe` umgestellt werden.


{% toggle %}
## Drucker unter Linux einrichten

### Canon MFP-BW

Um die Canon S/W Multifunktionsdrucker unter Linux nutzen zu können, benötigt man zunächst die passenden [Treiber](https://de.canon.ch/support/products/imagerunner/imagerunner-advance-8585-pro.html?type=drivers).

Wir gehen von der Verwendung des *UFR II/UFRII LT Printer Driver for Linux* aus.

Das Treiberarchiv muss entpackt werden und die darin enthaltene `install.sh` Datei mit sudo ausgeführt werden:

```bash
sudo ./install.sh
```

Die Treiber benötigen auf einem 64bit System einige i386 Pakete. Diese werden von dem Installationsscript automatisch nachinstalliert. Da die Anbindung des Druckers über das *SMB* Protokoll erfolgt, muss gegebenenfalls noch der smbclient nachinstalliert werden:

```bash
sudo apt-get install smbclient
```

Mit dem Treiberpaket werden eine Vielzahl von neuen PPD-Dateien installiert. Um das passende PPD für den Drucker herauszufinden, gibt man folgenden Befehl ein:

```bash
sudo lpinfo --make-and-model "Canon iR-ADV 8585/8595 III UFR II" -m
```

Die Ausgabe sollte wie folgt aussehen:

```
CNRCUPSIRADV85853ZK.ppd Canon iR-ADV 8585/8595 III UFR II
```

Wichtig ist hierbei der Name der PPD Datei, da dieser im folgenden angegeben werden muss.

Der Drucker kann nun mit Hilfe von **lpadmin** eingerichtet werden:

```bash
sudo /usr/sbin/lpadmin \
-p MFP-BW \
-o 'printer-is-shared=false' \
-o 'auth-info-required=username,password' \
-o 'media=A4' \
-E \
-v "smb://print-rj-a.ost.ch/FollowMe-RJ-BW" \
-D "MFP-BW" \
-m CNRCUPSIRADV85853ZK.ppd
```

Überprüfen lässt sich die Einrichtung mit dem Befehl:

```bash
lpoptions -p MFP-BW
```

Für die Anmeldung am Drucker wird das HSR.ch-Login benötigt. Damit die Anmeldedaten abgefragt werden, muss das Paket system-config-printer installiert werden:

```bash
sudo apt-get install system-config-printer
```

Das Applet muss automatisch beim einloggen des Benutzers gestartet werden:

```bash
cp /etc/xdg/autostart/print-applet.desktop ~/.config/autostart/
sed -i 's/NotShowIn=KDE;GNOME;Cinnamon;/NotShowIn=KDE;Cinnamon;/' ~/.config/autostart/print-applet.desktop
```

Sollte nicht GNOME zum Einsatz kommen, kann der obige Befehl entsprechend angepasst werden.

Es wird empfohlen sich einmal von der Desktopumgebung abzumelden und wieder anzumelden. Alternativ kann man das applet manuell starten. Dazu gibt man **Alt+F2** ein und tippt dort `system-config-printer-applet` gefolgt von **Enter** ein.

Nun öffnet man eine GTK3 Applikation wie **gedit** und löst von dort einen Druck aus. Es sollte eine Username/Passwortaufforderung erscheinen. Als Benutzername wird der HSR.ch Kurzname angegeben. Der Haken bei 'Passwort speichern' sollte gesetzt werden.

Weitere Informationen dazu findest du im [Github Issue #16: Drucker unter Linux einrichten](https://github.com/openhsr/www.open-ost.ch/issues/16)
{% endtoggle %}
