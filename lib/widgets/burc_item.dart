import 'package:burc_app/Model/burc.dart';
import 'package:burc_app/page/burc_detail.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc gelenBurc;
  const BurcItem({super.key, required this.gelenBurc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetail(secilenBurc: gelenBurc),
                ),
              );
            },
            leading: Image.asset("images/${gelenBurc.burcKucukResim}"),
            title: Text(gelenBurc.burcAdi),
            subtitle: Text(gelenBurc.burcTarihleri),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}
