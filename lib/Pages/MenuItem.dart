class MenuItem {
  final String title;
  final String destination;

  MenuItem({required this.title, required this.destination});
}

final List<MenuItem> menuItems = [
  MenuItem(title: 'Home', destination: '/home'),
  MenuItem(title: 'GenABoard', destination: '/GenABoard'),
];
