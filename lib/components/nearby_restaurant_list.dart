import 'package:flutter/material.dart';
import 'package:foodcraft/components/custom-button.dart';

class _NearbyRestaurantItem {
  final String title;
  final String imagePath;
  final String stars;
  final String distance;

  _NearbyRestaurantItem(this.title, this.imagePath, this.stars, this.distance);
}

class NearbyRestaurantList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NearbyRestaurantList();
}

class _NearbyRestaurantList extends State<NearbyRestaurantList> {
  bool isContentShow = true;
  final List<_NearbyRestaurantItem> items = [
    _NearbyRestaurantItem(
      'KFC Ahmad Yani',
      'lib/assets/images/kfc.jpg',
      '4.8',
      '1 Km',
    ),
    _NearbyRestaurantItem(
      'Recheese Factory',
      'lib/assets/images/recheese.jpg',
      '4.8',
      '3 Km',
    ),
    _NearbyRestaurantItem(
      'McDonald',
      'lib/assets/images/mcd.jpg',
      '4.6',
      '6.5 Km',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          _ListTitle(
            onTap: () {
              setState(() {
                this.isContentShow = !this.isContentShow;
              });
            },
            isShow: this.isContentShow,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: this.isContentShow
                ? _ListContent(
                    items: this.items,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class _ListTitle extends StatelessWidget {
  final void Function()? onTap;
  final bool isShow;

  const _ListTitle({
    Key? key,
    this.onTap,
    this.isShow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomButton(
                      icon: Icons.restaurant_menu,
                      iconColor: Colors.white,
                      iconSize: 18.0,
                      color: Color(0xFFED6826),
                      borderRadius: 50.0,
                      size: 30.0,
                      elevation: 2.5,
                    ),
                  ),
                  Text(
                    'Restoran Teratas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              icon: this.isShow ? Icons.expand_more : Icons.expand_less,
              iconColor: Colors.white,
              size: 30.0,
              borderRadius: 50.0,
              color: Colors.transparent,
              onTap: this.onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final List<_NearbyRestaurantItem> items;

  const _ListContent({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: this.items.length,
      itemBuilder: (BuildContext ctx, int index) {
        return _ListTile(item: this.items[index]);
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  final _NearbyRestaurantItem item;

  const _ListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.fromLTRB(0, 5.0, 7.5, 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              this.item.imagePath,
            ),
          ),
        ),
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "${this.item.title}  ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              width: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFFED6825),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: Colors.black26),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.item.stars,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Icon(
                      Icons.star,
                      size: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        subtitle: RichText(
          text: TextSpan(
            text: '${this.item.distance} ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' dari lokasi anda',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              icon: Icons.local_mall,
              iconColor: Colors.white,
              iconSize: 18.0,
              borderRadius: 50.0,
              size: 30.0,
              color: Theme.of(context).primaryColor,
              onTap: () {},
            ),
            Text(
              'Pesan',
              style: TextStyle(
                fontSize: 10.0,
                height: 1.5,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
