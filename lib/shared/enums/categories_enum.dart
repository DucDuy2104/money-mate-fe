import 'package:flutter/material.dart';

enum CategoriesEnum {
  // Expense Categories
  food(Icons.fastfood, Colors.orange),
  transport(Icons.directions_car, Colors.blue),
  shopping(Icons.shopping_bag, Colors.pink),
  bill(Icons.receipt, Colors.red),
  entertainment(Icons.movie, Colors.purple),
  education(Icons.school, Colors.brown),
  healthcare(Icons.medical_services, Colors.green),
  beauty(Icons.face, Colors.amber),
  sport(Icons.sports_soccer, Colors.cyan),
  technology(Icons.computer, Colors.grey),
  gift(Icons.card_giftcard, Colors.deepPurple),
  home(Icons.home, Colors.indigo),
  pet(Icons.pets, Colors.brown),
  insurance(Icons.health_and_safety, Colors.teal),
  investment(Icons.attach_money, Colors.green),
  tax(Icons.account_balance, Colors.blueGrey),
  coffee(Icons.coffee, Colors.brown),
  dining(Icons.restaurant, Colors.orange),
  clothing(Icons.checkroom, Colors.deepOrange),
  book(Icons.book, Colors.lightBlue),

  // Income Categories
  salary(Icons.monetization_on, Colors.green),
  bonus(Icons.stars, Colors.amber),
  stock(Icons.trending_up, Colors.blue),
  interest(Icons.account_balance, Colors.indigo),
  incomeGift(Icons.card_giftcard, Colors.purple),
  sales(Icons.shopping_cart, Colors.orange),
  rental(Icons.home, Colors.teal),
  freelance(Icons.work, Colors.pink),
  dividend(Icons.pie_chart, Colors.deepOrange),
  cashback(Icons.assignment_return, Colors.cyan),
  receivedGift(Icons.redeem, Colors.deepPurple),
  allowance(Icons.support, Colors.lightGreen);

  final IconData icon;
  final Color color;

  const CategoriesEnum(this.icon, this.color);

  static CategoriesEnum parseEnum(String value) {
    return CategoriesEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => CategoriesEnum.food,
    );
  }
}
