# aBitViral

aBitViral (ABV) is changetip in the real world (tnx internet, tnx mobile devices, tnx geolocation)


### Mobile App:

[web + android + ios]

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



notes:

GUARDIZE

Install procedure:

`mkdir -p haml sass coffee`