import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String,dynamic>> transactionData = [
  {
    'icon': FontAwesomeIcons.burger,
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
    'description': 'McDonalds',
    'color': Colors.yellow,
    'card' : 'Credit Card',
  },
  {
    'icon': FontAwesomeIcons.bagShopping,
    'name': 'Shoping',
    'totalAmount': '-\$300.00',
    'date': 'Today',
    'description': 'Pandora',
    'color': Colors.purple,
    'card' : 'Credit Card',
  },
  {
    'icon': FontAwesomeIcons.heartCircleCheck,
    'name': 'Health',
    'totalAmount': '-\$67.00',
    'date': 'Yesterday',
    'description': 'Medicine',
    'color': Colors.red,
    'card' : 'Debit Card',
  }
];