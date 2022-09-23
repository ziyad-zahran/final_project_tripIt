class LocationItem {
  final String image, country, city;

  LocationItem({
    required this.image,
    required this.country,
    required this.city,
  });
}

List<LocationItem> locationItem = [
  LocationItem(
    image: "assets/images/usa.png",
    country: "USA",
    city: "New York",
  ),
  LocationItem(
    image: "assets/images/france.png",
    country: "France",
    city: "Paris",
  ),
  LocationItem(
    image: "assets/images/india.png",
    country: "India",
    city: "Agra",
  ),
  LocationItem(
    image: "assets/images/england.png",
    country: "England",
    city: "London",
  ),
  LocationItem(
    image: "assets/images/australia.png",
    country: "Australia",
    city: "Sydney",
  ),
];
