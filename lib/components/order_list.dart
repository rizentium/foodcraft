import 'package:flutter/material.dart';
import 'package:foodcraft/components/custom-button.dart';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderList();
}

class _OrderList extends State<OrderList> {
  bool isContentShow = true;

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
            child: this.isContentShow ? _ListContent() : Container(),
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
                      imagePath: 'lib/assets/icons/box.png',
                      iconColor: Colors.white,
                      iconSize: 18.0,
                      color: Color(0xFFED6826),
                      borderRadius: 50.0,
                      size: 30.0,
                      elevation: 2.5,
                    ),
                  ),
                  Text(
                    'Pesanan Terkini',
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        _ListTile(),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
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
              'lib/assets/images/avatar.jpg',
            ),
          ),
        ),
        title: Text('Gibran Mulyana'),
        subtitle: Text('Pesanan sudah di jalan'),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              icon: Icons.message_outlined,
              iconColor: Colors.white,
              iconSize: 18.0,
              borderRadius: 50.0,
              size: 30.0,
              color: Theme.of(context).primaryColor,
              onTap: () {},
            ),
            Text(
              'Chat',
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
