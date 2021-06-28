import 'package:flutter_buttons/catalog.dart';
import 'package:flutter_buttons/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  CatalogModel _catalog;

  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // COLLECTION OF IDS
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //  GET ITEMS IN CART
  List<Item> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  // GET TOTAL PRICE
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // ADD ITEMS
  void add(Item item) {
    _itemIds.add(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
