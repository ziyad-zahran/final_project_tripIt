class Model {
  String image, title, subtitle;

  Model({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

class BoardingController {
  int currentPage = 0;
  List<Model> model = [
    Model(
        title: 'Plan Your Trip',
        image:"assets/images/on boarding 1.png",
        subtitle:
            'Plan your trip, choose your destination.\nPick the best place for your holiday.'),
    Model(
        title: 'Select The Date',
        image:"assets/images/on boarding 2.png",
        subtitle:
            'Select the day, book your ticket. We give\nyou the best price. We guarantied!'),
    Model(
        title: 'Enjoy Your Trip',
        image:"assets/images/on boarding 2.png",
        subtitle:
            'Enjoy your holiday! don\'t forget to take\na photo and share to the world'),
  ];
}
