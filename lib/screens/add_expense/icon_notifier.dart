import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconNotifier extends ChangeNotifier {
  IconData? _selectedIcon;
  final List<IconData> _availableIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.carrot,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.pizzaSlice,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.burger,
    FontAwesomeIcons.couch,
    FontAwesomeIcons.car,
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.train,
    FontAwesomeIcons.paw,
    FontAwesomeIcons.gamepad,
    FontAwesomeIcons.music,
    FontAwesomeIcons.paintbrush,
    FontAwesomeIcons.camera,
    FontAwesomeIcons.book,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.phone,
    FontAwesomeIcons.tv,
    FontAwesomeIcons.headset,
    FontAwesomeIcons.tablet,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.gift,
    FontAwesomeIcons.creditCard,
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.dollarSign,
    FontAwesomeIcons.euroSign,
    FontAwesomeIcons.sterlingSign,
    FontAwesomeIcons.yenSign,
    FontAwesomeIcons.rubleSign,
    FontAwesomeIcons.headphones,
    FontAwesomeIcons.shoePrints,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.gift,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.faceSmile,
    FontAwesomeIcons.faceSadCry,
    FontAwesomeIcons.faceAngry,
    FontAwesomeIcons.faceSurprise,
    FontAwesomeIcons.faceGrin,
    FontAwesomeIcons.faceLaugh,

  ];

  IconData? get selectedIcon => _selectedIcon;
  
  List<IconData> get availableIcons => _availableIcons;

  static Future<IconNotifier> init() async {
    return IconNotifier();
  }

  void selectIcon(IconData icon) {
    _selectedIcon = icon;
    notifyListeners();
  }

  void resetIcon() {
    _selectedIcon = null;
    notifyListeners();
  }
}