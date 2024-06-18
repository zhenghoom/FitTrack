import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242f3f),
      appBar: AppBar(
        title: Text('Diet Recommendation', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your BMI category:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
                  Button(context, 'Underweight', Colors.blue, UnderweightPage()),
                  Button(context, 'Normal Weight', Colors.green, NormalPage()),
                  Button(context, 'Overweight', Colors.orange, OverweightPage()),
                  Button(context, 'Obesity', Colors.red, ObesityPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(BuildContext context, String title, Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}
Widget foodCategoryCard(String imagePath, String category, String food, Color color) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.cover),
          SizedBox(height: 8.0),
          Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '$food',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
class UnderweightPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27243f),
      appBar: AppBar(
        title: Text('Underweight Diet',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            foodCategoryCard("lib/assets/food/vegetable.png", "Vegetables", "Corns, Avocado, Sweet Potato, Soybeans, Peas", Colors.green),
            foodCategoryCard("lib/assets/food/carbohydrates.png", "Carbohydrates", 'Rice, Whole grain bread, Potato, Bananas', Colors.pinkAccent),
            foodCategoryCard("lib/assets/food/beef.png", 'Protein', 'Steak, Salmon, Eggs, Protein Shakes, Chicken Breast', Colors.orange),
            foodCategoryCard("lib/assets/food/dairy-products.png", 'Dairy', 'Milk, Cheese, Yogurt', Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

class NormalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27243f),
      appBar: AppBar(
        title: Text('Normal Weight Diet',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            foodCategoryCard("lib/assets/food/vegetable.png", "Vegetables", "Whole Fruits, Brocolli, Asparagus, Spinach, Kale, Collard Greens", Colors.green),
            foodCategoryCard("lib/assets/food/carbohydrates.png", "Carbohydrates", 'Brown Rice, Whole Wheat, Quinoa', Colors.pinkAccent),
            foodCategoryCard("lib/assets/food/beef.png", 'Protein', 'Fish, Nuts, Seeds, Beans', Colors.orange),
            foodCategoryCard("lib/assets/food/dairy-products.png", 'Dairy', 'Milk, Cheese, Yogurt', Colors.lightBlueAccent),
          ],
        ),
      ),
    );
  }
}

class OverweightPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27243f),
      appBar: AppBar(
        title: Text('Overweight Diet',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            foodCategoryCard("lib/assets/food/vegetable.png", "Vegetables", "Brocolli, Cauliflower, Cabbage, Spinach, Kale, Collard Greens", Colors.green),
            foodCategoryCard("lib/assets/food/carbohydrates.png", "Carbohydrates", 'Brown Rice, Whole Wheat Bread, Oatmeal', Colors.pinkAccent),
            foodCategoryCard("lib/assets/food/beef.png", 'Protein', 'Fish, Egg White, Peas, Beans, Tofu, Chicken Breast', Colors.orange),
            foodCategoryCard("lib/assets/food/dairy-products.png", 'Dairy', 'Skim Milk, Cottage Cheese, Greek Yogurt', Colors.lightBlueAccent),
            foodCategoryCard("lib/assets/food/beverage.png", "Beverages", "Water, Herbal Teas, Green Teas, Infused Water with Lemon", Colors.purpleAccent),
          ],
        ),
      ),
    );
  }
}

class ObesityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27243f),
      appBar: AppBar(
        title: Text('Obesity Diet',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            foodCategoryCard("lib/assets/food/vegetable.png", "Vegetables", "Zucchini, Tomatoes, Lettuce, Spinach, Kale, Whole Fruits", Colors.green),
            foodCategoryCard("lib/assets/food/carbohydrates.png", "Carbohydrates", 'Brown Rice, Whole Wheat Bread, Oatmeal, Quinoa', Colors.pinkAccent),
            foodCategoryCard("lib/assets/food/beef.png", 'Protein', 'Salmon, Tuna, Egg White, Lentils, Beans, Tofu, Chicken Breast', Colors.orange),
            foodCategoryCard("lib/assets/food/dairy-products.png", 'Dairy', 'Skim Milk, Cottage Cheese, Low-fat Yogurt', Colors.lightBlueAccent),
            foodCategoryCard("lib/assets/food/beverage.png", "Beverages", "Water, Herbal Teas, Green Teas, Infused Water with Lemon", Colors.purpleAccent),
          ],
        ),
      ),
    );
  }
}
