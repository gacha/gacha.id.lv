---
layout: post
title: Lokāla latviešu vārdnīcas aplikācija linux vidē
categories: []
tags: ["vārdnīca", "linux", "aplikācijas"]
published: true
enable_comments: true
---
{% include JB/setup %}
Ik pa laikam kāds draugs interesējās par Linux uzstādīšanu un nākamais jautājums pēc ofisa programmnodrošinājuma ir - *"Vai ir kas līdzīgs tildes biroja vārdnīcai?"*. Līdz šim tā īsti nebija ko atbildēt, jo pats lietoju online rīkus un par ko tādu nebiju interesējies.

Mazliet parakos internetā un nonācu pie [StarDict](http://stardict.sourceforge.net/), kura pieejama praktiski visos populārākajos Linux repozitorijos - bet pēc uzstādīšanas tai nav pieejama latviešu valodas vārdnīca. To var nokārtot - novelkam kādu no:

- [open-news.lv - stardict_lv.tar.gz](http://help.open-news.lv/wp-content/uploads/2008/12/stardict_lv.tar.gz)
- [odo.lv - stardict_lv.tar.gz](http://odo.lv/ftp/files/stardict_lv.tar.gz)

atspiežam un **saturu** iekopējam mapē `/usr/share/stardict/dic/`. Un atverot `StartDict` mēs redzam ko stipri līdzīgu šim:

![StartDict](https://s3-eu-west-1.amazonaws.com/gachaidlv/articles/startdict.png)

Uzzināju arī jaunu vārdu - *ziloņa* EN tulkojumā *elephantine*, vai nav skaisti :)