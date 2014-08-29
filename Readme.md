# aBitViral

Help spread bitcoin in your area via microdonations!
Get your first bitcoins by looking around you!


choose: donate or get bitcoins


aBitViral (ABV) is changetip in the real world (tnx internet, tnx mobile devices, tnx geolocation)


### Mobile App:

demo finder screen:

![](http://uploads.makevoid.com/ios_finder_demo.png)


*platforms:*

[web + android + ios]

### Donor:

- deposit some btc in your ABV hosted wallet
- choose the amount in % you want to donate each time
- set the minimum time from one donation to the other
- walk/be in the nearest city centre with the app open to
- click [Stick donation here] to let the donation stay in the place even if your app is closed

### Finder:

- [get a bitcoin wallet](https://bitcoin.org/en/choose-your-wallet)
- open the app
- search for a donor
- walk by
- find them thank them (optional)



### deploy versions timeline


- alpha
- add bots
- add HTTPS
- beta
- conduce broad tests, scale it up
- 1.0

### views:

---
default main:

[tip people]
[find tips near you]


TIPPER (not the right word:)

---
main view:

  "Your Address:"
  <address>
  balance: 0
  [add funds]

  [settings]

---
add funds view:

  <qr code>

---
settings view

  amount: 4%
  range


>>>>>

TIPPED

---
find tip (map)

  map
  minimal ui
  button: ask friend to join:  sharable link - email address / sms number



>>>
service - implementation details

  location loopback (all clients send location)
  API server (TODO: setup, use and document HTTPS config on production environment)

  server notifies clients
    JSON API -
    slow polling (1 min)



#### The Tip Giver

Send tip money from wallet to ABV

---

#### The Tip Receiver

Find a Tipper
Sees a map of Tippers

---

Open source licensed:

You are free to use this code and free to contribute to the project.

---


### API Implementation details

geo query:

SELECT id, name,
6371 * 2 * ASIN(SQRT(POWER(SIN(RADIANS(orig.lat - ABS(hotels.latitude))), 2) + COS(RADIANS(orig.lat)) * COS(RADIANS(ABS(hotels.latitude))) * POWER(SIN(RADIANS(orig.long - hotels.longitude)), 2))) AS distance
FROM hotels
HAVING distance < 10
ORDER BY distance LIMIT 10;


TODO: use scalable query
http://vinsol.com/blog/2011/08/30/geoproximity-search-with-mysql/


notes:

GUARDIZE

Install procedure:

`mkdir -p haml sass coffee`