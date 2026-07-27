---
layout: page
permalink: /contribute/
---

# Webseite [www.open-ost.ch](https://www.open-ost.ch/)

## Wie kann ich mithelfen?
Erst einmal: Wir freuen uns über DEINE Mithilfe :thumbsup::tada:

Wenn du Ideen oder Fragen hast, über einen Schreibfehler gestolpert bist, etwas nicht
verständlich findest oder uns loben / kritisieren möchstest, dann freuen wir uns riesig von dir zu hören!

Wir verwalten und diskutieren unsere Aufgaben mittels [Github Issues](https://github.com/openhsr/www.open-ost.ch/issues).
Wenn du mit Github nicht vertraut bist, dann schreib uns einfach [eine E-Mail](mailto:info@open-ost.ch)!

Am wichtigsten ist, dass du dich meldest - wir helfen dir geren weiter!

## Bevor du loslegst....
Um mitarbeiten zu können, solltest du ein Grundwissen über Git haben. Ein guter Einstieg ist [das Interaktive Git Tutorial von Github](https://try.github.io/).

Grob können wir die folgenden Arten von Beiträgen unterscheiden:

1. Erweitern und Korrigieren von Dokumentationen und Artikeln zu Programmen
2. Eigene Tipps & Tricks
3. Änderungen am Layout und der Struktur der Webseite


Für reine Textbeiträge (1 und 2) musst du nicht wirklich verstehen, wie die Webseite zusammengebaut wird. Alle Inhalte werden in Textdateien in den Verzeichnissen ``_hsr``, ``_app``, ``tipps`` und ``pages`` verwaltet (siehe [Seitenhierarchie](https://www.open-ost.ch/styleguide/#seitenhierarchie)). Diese Textdateien sind in *Markdown* geschrieben. Die [einfache Einführung in Markdown von Designbits](http://www.designbits.de/artikel/markdown-eine-kleine-einfuehrung/) ist ein guter Einstiegspunkt - eine etwas ausführlichere Syntaxbeschreibung ist [Adam Pritchards Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

Aufgepasst: Im Verzeichnis ``_site`` solltest du nichts von Hand anpassen, denn die Änderungen werden automatisch verworfen.

Für ein einheitliches Look & Feel haben wir einen einfachen **[Styleguide](https://www.open-ost.ch/styleguide/)** erstellt. Dieser ist nicht in Stein gemeisselt - du darfst gerne Änderungen vorschlagen!

Bevor du Änderungen am Layout und der Struktur der Webseite (3) vornimmst, solltest du das im Vorfeld mit uns besprechen! Am besten via [Github Issues](https://github.com/openhsr/www.open-ost.ch/issues) oder im persönlichen Gespräch.

## Beispiel eines Beitrags
Folgende Schritt für Schritt Beschreibung eines Beitrags soll dir aufzeigen,
wie du auch beitragen kannst. Konkret wird ein Tippfehler korrigiert.

1. [Ich habe das Projekt lokal eingerichtet](#projekt-lokal-einrichten).
2. Ehe du Änderungen vornimmst, solltest du sicherstellen, dass die aktuellste Version ausgecheckt ist

    ```bash
    git checkout master
    git pull origin master
    ```

3. Ich erstelle und wechsle auf einen lokalen Branch

    ```bash
    git checkout -b fix-typo
    ```

4. Der Fehler ist auf der Unterseite Community (`/community/`). Anhand der [Seitenhierarchie]('/styleguide/#seitenhierarchie') finde ich heraus, wo die betroffene Datei liegt: `pages/community.md`.
5. Ich öffne die Datei in meinem Editor.
6. Der Fehler ist dank der Suchfunktion schnell gefunden. Also schnell korrigieren!
7. Nun bin ich bereit zum Check-in. Als erstes *stage* ich die betroffene Datei:

    ```bash
    git add pages/community.md
    ```
8. Ich überlege mir eine kurze und aussagekräftige Commit-Message und mache den Commit:

    ```bash
    git commit -m "Fix typo in URL to statuten"
    ```
9. Ich pushe nun meine Änderungen auf Github:

    ```bash
    git push origin fix-typo
    ```
8. Nun bin ich bereit zum [Pull-Request](https://help.github.com/articles/using-pull-requests/). <br> Vorher gehe ich die [Checkliste vor einem Pull-Request](#checkliste-vor-einem-pull-request) durch.

9. Auf der Seite meines Forks klicke ich auf `Pull request`: <br>
   ![Screenshot zum start eines Pull requests](/assets/contribute/beispiel_beitrag_1.png)
9. Ich überprüfe folgende Punkte:

    1. Der *Base Fork* enspricht dem originalen Repository (openhsr/www.open-ost.ch) und der *Base Branch* ist `master`
    2. Der *Head Fork* enspricht meinem Repository und der korrekte Branch meines Repositories ist ausgewählt - hier also `fix-typo`
    3. Meine Änderungen können gemerged werden

    Los gehts (4)! <br>
   ![Screenshot zur Überprüfung des Pull requests](/assets/contribute/beispiel_beitrag_2.png)
10. Ich schreibe eine kurze Beschreibung zu meine Pull request:<br>
    ![Screenshot zur Beschreibung](/assets/contribute/beispiel_beitrag_3.png)
11. Der Pull request ist nun eröffnet! Hier können nun Code-Reviews / Diskussionen enstehen bevor
    der Commit gemerged wird.
12. Ist alles OK, so wird der Pull-Request gemerged - und damit ist mein Beitrag abgeschlossen:
    ![Screenshot - gemerged](/assets/contribute/beispiel_beitrag_4.png)


## Checkliste vor einem Pull-Request

- Ich habe alle Änderungen auf Rechtschreibefehler überprüft.
- In einem Pull-Request sind nur Änderung betreffend *einer* Sache (Bsp. Rechtschreibefehler oder *ein* neuer [Tipp](https://www.open-ost.ch/tipps/) usw.).
- Meine Änderungen werden korrekt dargestellt.
- Das Generieren der Webseite gibt keine Fehler und Warnungen.


## Projekt lokal einrichten

Um an der Webseite mitarbeiten zu können, benötigst du einen [Github Account](http://github.com/join).

1. **Benötigte Abhängigkeiten installieren**<br>
   Bevor du loslegen kannst, musst du [Git](https://git-scm.com/), Make und [Docker](https://docs.docker.com/engine/installation/) installieren: <br>
   [Git Jetzt installieren](http://apt.ubuntu.com/p/git)
   [Make Jetzt installieren](http://apt.ubuntu.com/p/make)
   [Docker Jetzt installieren](http://apt.ubuntu.com/p/docker)
2. **Forke das Projekt auf Github**<br>
   Gehe dazu mit dem Webbrowser auf das [Repository www.open-ost.ch](https://github.com/openhsr/www.open-ost.ch) und klicke auf `Fork`:<br>
   ![Screenshot zum Forken eines Projekts](/assets/contribute/projekt_einrichten_1.png)
3. Wenn du in einer Organisation bist, dann Forke das Projekt zu deinem Benutzer: <br>
   ![Screenshot wohin geforkt werden soll](/assets/contribute/projekt_einrichten_2.png)
4. Du bist nun auf deinem Fork des Projekts. Kopiere die URL zum Repository:
   ![Screenshot des neu erstellten Forks](/assets/contribute/projekt_einrichten_3.png)
5. Öffne ein [Terminal](https://wiki.ubuntuusers.de/Terminal/), klone deinen Fork und wechsle in das Arbeitsverzeichnis:

    ```bash
    git clone <url-zum-fork>
    cd www.open-ost.ch
    ```
6. Das war es schon. Nun kannst du mit dem folgenden Kommando die Webseite bauen. Unter macOS muss make ohne sudo aufgerufen werden:

    ```bash
    sudo make
    ```
7. Du kannst nun mit dem Browser auf der Addresse <http://localhost:4000> deine lokale Kopie der open\OST Webseite aufrufen.

Wenn du nun Änderungen vornimmst, wird die Webseite automatisch neu generiert.

Wenn du genug hast, kannst du mit der Tastenkombination <kbd>ctrl</kbd> + <kbd>c</kbd> abbrechen.

## Technischer Hintergrund
Die neue Seite des open\OST ist im Gegensatz zu früher kein dynamisches [Wiki](https://de.wikipedia.org/wiki/Wiki), sondern eine mit [Jekyll](http://jekyllrb.com) generierte statische Webseite.

Mehr Details zu Jekyll findest du auf der [offiziellen Jekyll Webseite](http://jekyllrb.com).

Die RubyGems werden über den [Bundler](https://bundler.io/) verwaltet. Das `Gemfile.lock` lockt die Gems und Dependency auf spezifische Versionen. Wenn diese geupdated werden sollen kann man `make updatedeps` oder direkt `bundle update` im Docker Container ausführen. Im `Gemfile` sind sämtliche Gems aufgelistet und auf die Major-Version gelockt. Um einen Major-Update zu machen muss dies angepasst werden.

Um festzustellen, ob die Gems outdated sind oder bekannte Vulnerabilities dazu existieren, kann das Tool [gemsurance](https://github.com/appfolio/gemsurance) verwendet werden. Am einfachsten installiert man es im Docker Container und führt es aus: `gem install gemsurance && gemsurance`. Dies erstellt eine `gemsurance_report.html` Datei, welche sämtliche Gems mit dem aktuellen Status auflistet.
