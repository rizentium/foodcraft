import 'package:flutter/cupertino.dart';
import 'package:foodcraft/components/ads-carousel.dart';
import 'package:foodcraft/components/header.dart';
import 'package:foodcraft/components/nearby_restaurant_list.dart';
import 'package:foodcraft/components/order_list.dart';
import 'package:foodcraft/components/wallet-card.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderWidget(),
        WalletCardWidget(),
        OrderList(),
        AdsCarouselWidget(),
        NearbyRestaurantList(),
      ],
    );
  }
}
