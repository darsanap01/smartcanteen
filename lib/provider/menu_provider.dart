import 'package:flutter/material.dart';
import 'package:smartcanteen/model/food_item.dart';

class MenuProvider with ChangeNotifier {

List<FoodItem> _menu = [

  FoodItem(
    name: "Burger",
    price: 50,
    category: "Snacks",
    image: "https://images.unsplash.com/photo-1553530666-ba11a90caa2d",
  ),
  FoodItem(
    name: "Sandwich",
    price: 40,
    category: "Snacks",
    image: "https://images.unsplash.com/photo-1553530666-ba11a90caa2d",
  ),
  FoodItem(
    name: "French Fries",
    price: 60,
    category: "Snacks",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
  FoodItem(
    name: "Samosa",
    price: 20,
    category: "Snacks",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),

  FoodItem(
    name: "Pizza",
    price: 100,
    category: "Meals",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
  FoodItem(
    name: "Chicken Roll",
    price: 70,
    category: "Meals",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
  FoodItem(
    name: "Fried Rice",
    price: 90,
    category: "Meals",
    image: "https://images.unsplash.com/photo-1553530666-ba11a90caa2d",
  ),
  FoodItem(
    name: "Meals Combo",
    price: 120,
    category: "Meals",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),

  FoodItem(
    name: "Juice",
    price: 30,
    category: "Drinks",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
  FoodItem(
    name: "Tea",
    price: 15,
    category: "Drinks",
    image: "https://images.unsplash.com/photo-1553530666-ba11a90caa2d",
  ),
  FoodItem(
    name: "Coffee",
    price: 25,
    category: "Drinks",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
  FoodItem(
    name: "Milkshake",
    price: 50,
    category: "Drinks",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  ),
];


  List<FoodItem> get menu => _menu;

  void addItem(FoodItem item) {
    _menu.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _menu.removeAt(index);
    notifyListeners();
  }

  void updateItem(int index, FoodItem newItem) {
    _menu[index] = newItem;
    notifyListeners();
  }

  void toggleAvailability(int index, bool value) {
    _menu[index].available = value;
    notifyListeners();
  }
}
