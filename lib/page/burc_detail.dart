import 'package:burc_app/Model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetail extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetail({super.key, required this.secilenBurc});

  @override
  State<BurcDetail> createState() => _BurcDetailState();
}

class _BurcDetailState extends State<BurcDetail> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/${widget.secilenBurc.burcBuyukResim}"),
    );

    setState(() {
      appBarRengi = _generator.vibrantColor!.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarRengi,
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("${widget.secilenBurc.burcAdi} Burcu ve Özellikleri"),
              background: Image.asset(
                "images/${widget.secilenBurc.burcBuyukResim}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetay,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
