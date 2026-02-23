import 'package:flutter/material.dart';
import 'package:smartcanteen/model/food_item.dart';

class MenuProvider with ChangeNotifier {

List<FoodItem> _menu = [

  FoodItem(
    name: "Burger",
    price: 50,
    category: "Snacks",
    image: "https://cdn.uengage.io/uploads/29124/image-2341-1771061175.jpg",
  ),
  FoodItem(
    name: "Sandwich",
    price: 40,
    category: "Snacks",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6DHqoIPhtlRft2B96FmZ8vHnTdyY0qQXSOQ&s",
  ),
  FoodItem(
    name: "French Fries",
    price: 60,
    category: "Snacks",
    image: "https://www.kannammacooks.com/wp-content/uploads/french-fries-recipe.jpg",
  ),
  FoodItem(
    name: "Samosa",
    price: 20,
    category: "Snacks",
    image: "https://static.toiimg.com/thumb/53723352.cms?imgsize=212203&width=800&height=800",
  ),

  FoodItem(
    name: "Pizza",
    price: 100,
    category: "Meals",
    image: "https://wp-cdn.typhur.com/wp-content/uploads/2025/01/homemade-pizza-in-air-fryer.jpg",
  ),
  FoodItem(
    name: "Chicken Roll",
    price: 70,
    category: "Meals",
    image: "https://www.indianhealthyrecipes.com/wp-content/uploads/2024/02/chicken-kathi-roll-chicken-frankie.jpg",
  ),
  FoodItem(
    name: "Fried Rice",
    price: 90,
    category: "Meals",
    image: "https://www.sharmispassions.com/wp-content/uploads/2013/04/EggFriedRice4-500x500.jpg",
  ),
  FoodItem(
    name: "Meals Combo",
    price: 120,
    category: "Meals",
    image: "https://images.jdmagicbox.com/v2/comp/bangalore/l6/080pxx80.xx80.220405230905.v4l6/catalogue/madras-meal-company-marathahalli-bangalore-restaurants-hw726q8u7i.jpg",
  ),

  FoodItem(
    name: "Juice",
    price: 30,
    category: "Drinks",
    image: "https://www.acouplecooks.com/wp-content/uploads/2021/06/Strawberry-Water-006.jpg",
  ),
  FoodItem(
    name: "Tea",
    price: 15,
    category: "Drinks",
    image: "https://www.munatycooking.com/wp-content/uploads/2024/04/Three-glasses-filled-with-karak-chai.jpg",
  ),
  FoodItem(
    name: "Coffee",
    price: 25,
    category: "Drinks",
    image: "https://corkframes.com/cdn/shop/articles/Corkframes_Coffee_Guide_520x500_422ebe38-4cfa-42b5-a266-b9bfecabaf30.jpg?v=1734598727",
  ),
  FoodItem(
    name: "Milkshake",
    price: 50,
    category: "Drinks",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Strawberry_milk_shake_%28cropped%29.jpg/250px-Strawberry_milk_shake_%28cropped%29.jpg",
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
