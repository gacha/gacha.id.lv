---
layout: post
title: Media faili no tava Ubuntu uz tava TV izmantojot MediaTomb
categories: []
tags: ["dlna", "tv", "linux", "ubunt"]
published: true
enable_comments: true
---
{% include JB/setup %}
Daudziem jaunajiem TV ir iespēja to pieslēgt pie lokālā tikla, kā reiz manam Samsungam ir šāda iespēja un beidzot izdevās to pievienot lokālajam tiklam. Mazliet papētot noskaidrojās, ka TV spēj atrast lokālajā tiklā esošus [UPnP/DLNA](http://en.wikipedia.org/wiki/Digital_Living_Network_Alliance) serverus, tad no visiem [šeit uzskaitītajiem](http://www.rbgrn.net/content/21-how-to-choose-dlna-media-server-windows-mac-os-x-or-linux) serveriem es izvēlējos [MediaTomb](http://mediatomb.cc/), jo tas ir bezmaksas, pieejams uz Ubuntu un to ir iespējams nokonfigurēt tā, lai mans Samsung to redzētu.

![AllShare](http://www.samsung.com/ca/system/consumer/product/2010/04/01/un46c6300sfxzc/AllShare_DLNA_Certified.jpg)

Tātad liekam to virsū `sudo apt-get install mediatomb` un uzreiz pēc uzstādīšanas tas jau būs pieejams caur <http://127.0.0.1:49152/>, tikai tas mums neder jo tiek palaist ar mediatomb lietotāju, bet mums tas būs jāpalaiž ar mūsu lietotāju, lai varam izmantot visus savus media failus, tāpēc apstādināsim serveri `sudo service mediatomb stop`. Ja nu tomēr vēlaties darbināt to ar citu lietotāju, tad jāatceras tam pievienot attiecīgās atļaujas uz failiem.

Palaižam serveri `mediatomb`, kas izveido mums konfigurācijas failu, kuru atveram ar `gedit ~/.mediatomb/config.xml` un veicam sekojošas izmaiņas:

- Ja serveris palaižas ne vēlajamā tiklā, tad to varam norādīt zem `<server>` pievienojot `<interface>wlan0</interface> `.
- `<ui enabled="no" show-tooltips="yes">` -  `enabled="yes"` - lai strādātu WEB interfeiss
- `<name>MediaTomb</name>` uz `<name>Jāņa kaste</name>` - jeb kā nu vēlies lai tavs MEDIA serveris saucās.
- `<protocolInfo extend="no"/>` - `extend="yes"`
- **iespējams citiem TV šeit ir jāieraksta kas cits** - to jautā googlei, bet konkrēti šo es atradu [Ubuntu forumā](http://ubuntuforums.org/showthread.php?t=1198689), kas domāts tieši **Samsung TV**. Tātad atkomentējam `<custom-http-headers>` un ievietojam tur šīs rindas:

        <add header="transferMode.dlna.org: Streaming"/>
        <add header="contentFeatures.dlna.org: DLNA.ORG_OP=01;DLNA.ORG_CI=0;DLNA.ORG_FLAGS=017000 00000000000000000000000000"/>

- Iekš `<extension-mimetype ignore-unknown="no">` pievienojam `<map from="avi" to="video/mpeg"/>` un `<map from="mkv" to="video/x-matroska"/>` nomainām pret `<map from="mkv" to="video/mpeg"/>` - šādi būs redzami mkv un avi faili.
- `<transcoding enabled="no">` - `enabled="yes"`

Restartējam serveri `mediatomb` un atveram <http://127.0.0.1:49152/> un pievienojam savas Audio/Video/Bilžu mapes - atkaribā no failu daudzumu tie visi tiks pievienoti pēc neilga laika. Tagad atverot uz sava TV DLNA pārlūku, Samsung gadījumā "All share" sadaļu, jums tur būtu jāredz savs dators un jāvar redzēt visi pievienotie faili, ja nu tā nav, tad iespējams jums jāatver ports "49152", jeb jānomaina `<interface>` uz to pašu, kura subnetā atrodas pats TV, ja šis nelīdz, tad varam palaist serveri ar "-D" un pētīt to debug režīmā.

Šim serverim ir vēl viena ļoti noderīga iespēja - "[transcoding](http://mediatomb.cc/pages/transcoding)". Ja tavs TV atbalsta tikai mpeg/mp3/wav formātus, bet tavā kolekcijā ir arī ogg/ogv/wma/acc u.c. formāti, tad ir iespēja apmānīt TV un "on-the-fly" pārveidojot nesaprotamo formātu uz saprotamu izmantojot vlc vai ffmpeg. Tas konfigurējams sadaļā `<transcoding enabled="yes">` kur var pievienot attiecigus profilus un tos savienojot ar dažādiem failu formātiem sadaļā `<mimetype-profile-mappings>`. Pāris noderīgi profili atrodami [Gentoo-wiki](http://en.gentoo-wiki.com/wiki/MediaTomb#Alternative_Transcoders).


Vēl vari pameklēt kādu DLNA aplikāciju savam Android vai Iphone tālrunim, ar kuru ari tu varēsi atskaņot media failus savā TV.