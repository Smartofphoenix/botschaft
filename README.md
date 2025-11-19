# ![contacticon_small.png](resources%2Fassets%2Ficon%2Fcontacticon_small.png) WMC Test - Contacts

---

---

Schreiben Sie eine App, die die Favoriten von Kontakten verwalten kann.
Die Kontakte sind im Verzeichnis assets/data/dataset.json als Json Datei hinterlegt.
Die App sollte ähnlich den folgenden Screenshots sein! 

![img.png](resources%2Fimg.png)
* Auf der Hauptseite sollen mit ListTiles die Daten wie im oberen Bild ausgegeben werden.
  Die dazugehörigen Bilder URLS sind im JSON gespeichert. (Keine Bilder downloaden!)
  Ein Button in der AppBar führt zur Contactspage.


* Erstellen Sie ein Widget namens PersonTile.
  Speichern Sie alle Einträge in einer List!
  Das Minus am rechten Rand ist ein Icon und soll zum Löschen des Eintrages führen.


* **Bonus** ListTile als eigenes Widget soll StateLess bleiben, implementieren Sie für Änderungen eine Callback Function.


* Es gibt keine doppelten Einträge.

 
![img_1.png](resources%2Fimg_1.png)

* Verwenden Sie auf der *Contactpage* ein **DropdownButton**. Hier sollen in der **initState** 
die Daten geladen werden. Um einen Datenbankzugriff zu simulieren fügen Sie nach dem Lesen 
einen Delay von **1 Sekunde** hinzu. 


* Grundinitialisiert wird der DropdownButton mit **Max Mustermann**. 


* Damit der User nichts ändern kann bis alle Daten geladen worden sind, soll 
ein *ModalProgressHUD* darübergelegt werden.

![img_2.png](resources%2Fimg_2.png)

* Der Zurück-Button in der AppBar soll nichts zurückliefern, sondern auf die Hauptseite verweisen.

![img_3.png](resources%2Fimg_3.png)

* Das Klicken auf den DropdownButton Eintrag liefert diese **Person** an die Hauptseite über die *Navigation* zurück.

# Service Klasse Person
Ist die vollständige Kapselung der Klasse Person. Diese besitzt eine **statische** Methode
readData, welche die gegebene Json Datei lesen soll. Zurückgeliefert wird eine Liste von **Person**.

---


# Erweiterung
* Wurde ein Datensatz nicht hinzugefügt weil er schon vorhanden war, soll das auf der Hauptseite in der Snackbar angezeigt werden.
* Die Snackbar soll nach 2 Sekunden wieder verschwinden.


* Fügen Sie auf der Hauptseite einen weiteren Button in der AppBar hinzu, welcher dem User 
erlaubt die PersonTiles nach Vorname zu sortieren.

* Geben Sie der App ein Icon! (assets/icon/contacticon.png)

---

# Inportant Infos ..........
Passen Sie die pubspec.yaml an. 


# Dropdown Button
https://api.flutter.dev/flutter/material/DropdownButton-class.html

# ListTiles
https://api.flutter.dev/flutter/material/ListTile-class.html

# Modal Progress HUD
https://api.flutter.dev/flutter/dart-async/Future/Future.delayed.html

https://pub.dev/packages/modal_progress_hud_nsn
