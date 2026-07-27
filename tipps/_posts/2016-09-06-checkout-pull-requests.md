---
title: Github Pull-Requests lokal auschecken
tags: Entwicklung
---

Wer auf Github ein Projekt wartet, kennt die Situation: Ein neuer Pull-Request wird eröffnet und man möchte die Änderungen gerne lokal ausprobieren, bevor man sie merged. Aber wie geht das am einfachsten?

In diesem Tipp zeige ich am Beispiel vom Repository [openhsr/www.open-ost.ch](https://github.com/openhsr/www.open-ost.ch/), wie man bequem Pull-Requests lokal auschecken kann.

Falls du noch keine lokale Kopie des Projekts hast, dann klone es jetzt:

```bash
$ git clone https://github.com/openhsr/www.open-ost.ch.git
$ cd www.open-ost.ch/
```

Damit wir nicht jeden Pull-Request von Hand herunterladen müssen, ergänzen wir die Git-Konfiguration, so dass auch Pull-Requests bei einem `fetch` heruntergeladen werden.

```bash
$ git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
```

Wenn wir nun mittels `fetch` Änderungen aus Remote Repository herunterladen, werden auch Pull-Requests als Branches heruntergeladen:

```bash
$ git fetch
remote: Counting objects: 53, done.
remote: Total 53 (delta 20), reused 20 (delta 20), pack-reused 33
Unpacking objects: 100% (53/53), done.
From https://github.com/openhsr/www.open-ost.ch
 * [new ref]         refs/pull/14/head -> origin/pr/14
 * [new ref]         refs/pull/24/head -> origin/pr/24
 * [new ref]         refs/pull/27/head -> origin/pr/27
 * [new ref]         refs/pull/28/head -> origin/pr/28
 * [new ref]         refs/pull/29/head -> origin/pr/29
 ...
```

Mit jedem `fetch` werden nun also alle Pull-Requests als Branches heruntergeladen.

Ein beliebiger Pull-Request kann jetzt wie jeder andere Branch ausgecheckt werden:

```bash
$ git checkout pr/51
```


Wenn du dieses Kommando oft brauchst, lohnt es sich einen [Alias](https://wiki.ubuntuusers.de/alias/) einzurichten.

```bash
alias setup-pr-fetch="git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'"
```

## Links
* [Git Branching - Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
* [Checking out Pull-Requests locally](https://help.github.com/articles/checking-out-pull-requests-locally/)
* [Pull-Request proficiency: Fetching abilities unlocked!](http://blogs.atlassian.com/2014/08/how-to-fetch-pull-requests/)
