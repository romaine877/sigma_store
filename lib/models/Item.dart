class Item {
  final String id, name, description, image;
  final int price;
  int amount;
  String serverID;

  final bool isfavorite;

  Item({
    this.serverID,
    this.id,
    this.name,
    this.description,
    this.price,
    this.amount = 0,
    this.image,
    this.isfavorite = false,
  });

  void incrementAmount() {
    amount = amount + 1;
  }

  void removeAmount() {
    amount = 0;
  }

  void addServerID(String id) {
    serverID = id;
  }
}
