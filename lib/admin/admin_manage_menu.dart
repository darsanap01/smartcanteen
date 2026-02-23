import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcanteen/model/food_item.dart';
import 'package:smartcanteen/provider/menu_provider.dart';

class AdminManageMenuScreen extends StatelessWidget {
  const AdminManageMenuScreen({super.key});

  void editItem(BuildContext context, FoodItem item) {
    TextEditingController name = TextEditingController(text: item.name);
    TextEditingController price =
        TextEditingController(text: item.price.toString());
    TextEditingController category =
        TextEditingController(text: item.category);
    TextEditingController image =
        TextEditingController(text: item.image);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Item"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              TextField(
                controller: category,
                decoration: const InputDecoration(labelText: "Category"),
              ),
              TextField(
                controller: image,
                decoration: const InputDecoration(labelText: "Image Path"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              item.name = name.text;
              item.price = double.tryParse(price.text) ?? item.price;
              item.category = category.text;
              item.image = image.text;

              context.read<MenuProvider>().notifyListeners();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var menu = context.watch<MenuProvider>().menu;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Manage Menu"),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: menu.length,
        itemBuilder: (_, i) {
          final item = menu[i];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
  item.image,
  width: 50,
  height: 50,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return const Icon(Icons.fastfood);
  },
),

              ),

              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("₹${item.price}"),
                  Text("Category: ${item.category}"),
                ],
              ),

              trailing: Column(
                children: [

                  Switch(
                    value: item.available,
                    onChanged: (val) {
                      item.available = val;
                      context.read<MenuProvider>().notifyListeners();
                    },
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => editItem(context, item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () =>
                            context.read<MenuProvider>().deleteItem(i),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
