import 'package:flutter/material.dart';

import '../../data/model/dealer_model.dart';
import '../../data/model/truck_model.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

List<TruckModel> getCarList() {
  return <TruckModel>[
    TruckModel(
      "LCV",
      "KL 21 V 4665",
      [2580, 2600, 2620],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Truck",
      "KL 56 V 3456",
      [3580, 3600, 3620],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Container",
      "KL 10 V 4323",
      [4580, 4600, 4620],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Tanker",
      "KL 12 B 4768",
      [5580, 5600, 5620],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "LCV",
      "KA 15 V 2313",
      [1580, 1600, 1620],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Tanker",
      "TN 23 W 3456",
      [900, 1000, 1100],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Trailer",
      "KL 11 D 1289",
      [4000, 4100, 4200],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Truck",
      "TN 12 E 2897",
      [5000, 5100, 5200],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Tanker",
      "KL 14 V 3456",
      [6000, 6100, 6200],
      "Available Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "LCV",
      "TN 34 F 7845",
      [7000, 7100, 7200],
      "Available",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "Container",
      "KA 56 E 3423",
      [8000, 8100, 8200],
      "Available",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
    TruckModel(
      "LCV",
      "KL 04 V 3587",
      [9000, 9100, 9200],
      "Available Tomorrow",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg",
        "https://img.freepik.com/premium-vector/semi-trailer-truck-logo_74218-339.jpg"
      ],
    ),
    TruckModel(
      "Truck",
      "KL 14 R 1276",
      [1000, 1100, 1200],
      "Not Now",
      [
        "https://cvimg1.cardekho.com/p/630x420/in/eicher/pro-2049/eicher-pro-2049-47454.jpg"
      ],
    ),
  ];
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Truck",
      42,
      "https://img.freepik.com/premium-vector/semi-trailer-truck-logo_74218-339.jpg",
    ),
    Dealer(
      "Trailer",
      68,
      "https://img.freepik.com/premium-vector/semi-trailer-truck-logo_74218-339.jpg",
    ),
    Dealer(
      "LCV",
      10,
      "https://img.freepik.com/premium-vector/semi-trailer-truck-logo_74218-339.jpg",
    ),
  ];
}
