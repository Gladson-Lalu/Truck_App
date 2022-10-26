import 'package:flutter/material.dart';

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

class Car {
  String brand;
  String model;
  double price;
  String condition;
  List<String> images;

  Car(this.brand, this.model, this.price, this.condition, this.images);
}

List<Car> getCarList() {
  return <Car>[
    Car(
      "LCV",
      "KL 21 V 4665",
      2580,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Truck",
      "KL 56 V 3456",
      3580,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Container",
      "KL 10 V 4323",
      1100,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Tanker",
      "KL 12 B 4768",
      2200,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "LCV",
      "KA 15 V 2313",
      3400,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Tanker",
      "TN 23 W 3456",
      900,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Trailer",
      "KL 11 D 1289",
      4200,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Truck",
      "TN 12 E 2897",
      2300,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Tanker",
      "KL 14 V 3456",
      1450,
      "Available Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "LCV",
      "TN 34 F 7845",
      900,
      "Available",
      [
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Container",
      "KA 56 E 3423",
      900,
      "Available",
      [
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "LCV",
      "KL 04 V 3587",
      900,
      "Available Tommarow",
      [
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
    Car(
      "Truck",
      "KL 14 R 1276",
      1200,
      "Not Now",
      [
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
        "assets/images/mahindra-jayo.jpg",
      ],
    ),
  ];
}

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Truck",
      42,
      "assets\images\250-2506178_full-truck-load-icon-hd-png-download.png",
    ),
    Dealer(
      "Trailer",
      68,
      "assets\images\250-2506178_full-truck-load-icon-hd-png-download.png",
    ),
    Dealer(
      "LCV",
      10,
      "assets\images\250-2506178_full-truck-load-icon-hd-png-download.png",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}