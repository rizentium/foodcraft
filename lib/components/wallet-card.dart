import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcraft/components/custom-button.dart';

class WalletCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: _SaldoWidget(),
              ),
              Expanded(
                flex: 2,
                child: _CustomButtonWithLabel(
                  icon: Icons.local_mall,
                  label: 'Yuk Pesan!',
                ),
              ),
              Expanded(
                flex: 2,
                child: _CustomButtonWithLabel(
                  icon: Icons.add,
                  label: 'Tambah Saldo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaldoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            'Saldo Wallet',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5.0,
            right: 15.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black26),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'Rp 100.000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CustomButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CustomButtonWithLabel(
      {Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          icon: this.icon,
          iconColor: Theme.of(context).primaryColor,
          elevation: 10.0,
        ),
        Text(
          this.label,
          style: TextStyle(
            fontSize: 12.0,
            height: 2.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
