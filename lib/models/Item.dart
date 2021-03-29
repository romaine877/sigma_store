class Item {
  final String id, name, description, image;
  final int price;
  int amount;

  final bool isfavorite;

  Item({
    this.id,
    this.name,
    this.description,
    this.price,
    this.amount = 1,
    this.image,
    this.isfavorite = false,
  });

  void increaseAmount() {
    amount = amount + 1;
  }
}
