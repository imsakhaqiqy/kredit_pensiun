import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kredit_pensiun/beranda/beranda_model.dart';
import 'package:kredit_pensiun/constans.dart';
import 'package:kredit_pensiun/beranda/beranda_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kredit_pensiun/produk_kredit/pegawai_aktif_screen.dart';
import 'package:kredit_pensiun/produk_kredit/pensiunan_screen.dart';
import 'package:kredit_pensiun/produk_kredit/platinum_screen.dart';
import 'package:kredit_pensiun/produk_kredit/prapensiun_screen.dart';

class BerandaPage extends StatefulWidget {
  String namaLengkap;
  String gajiPerbulan;
  String tanggalLahir;
  String bankGaji;

  BerandaPage(
      {this.namaLengkap, this.gajiPerbulan, this.tanggalLahir, this.bankGaji});
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Titled> _kreditPensiunServiceList = [];
  List<Titled> _topUpTagihanList = [];
  List<Titled> _kreditPensiunFeaturedList = [];
  List<Titled> _kreditPensiunNewsList = [];
  List<Titled> _kreditPensiunTipsList = [];
  final List<String> imgList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png',
    'assets/images/banner5.png',
  ];
  @override
  void initState() {
    super.initState();

    _kreditPensiunServiceList.add(new Titled(
        image: "assets/images/pensiunan.png", title: "Pegawai Aktif"));
    _kreditPensiunServiceList.add(new Titled(
        image: "assets/images/pra_pensiun.png", title: "Pra Pensiunan"));
    _kreditPensiunServiceList.add(
        new Titled(image: "assets/images/pensiunan.png", title: "Pensiunan"));
    _kreditPensiunServiceList.add(new Titled(
        image: "assets/images/pensiun_platinum.png", title: "Platinum"));

    _topUpTagihanList
        .add(new Titled(image: "assets/images/pulsa.png", title: "Pulsa"));
    _topUpTagihanList
        .add(new Titled(image: "assets/images/pln.png", title: "PLN"));
    _topUpTagihanList.add(
        new Titled(image: "assets/images/paket_data.png", title: "Paket Data"));
    _topUpTagihanList.add(new Titled(
        image: "assets/images/voucher_game.png", title: "Voucher Game"));

    _kreditPensiunFeaturedList
        .add(new Titled(title: "NEWS 1", image: "assets/images/product.jpg"));
    _kreditPensiunFeaturedList
        .add(new Titled(title: "NEWS 2", image: "assets/images/product.jpg"));
    _kreditPensiunFeaturedList
        .add(new Titled(title: "NEWS 3", image: "assets/images/product.jpg"));
    _kreditPensiunFeaturedList
        .add(new Titled(title: "NEWS 4", image: "assets/images/product.jpg"));
    _kreditPensiunFeaturedList
        .add(new Titled(title: "NEWS 5", image: "assets/images/product.jpg"));

    _kreditPensiunNewsList
        .add(new Titled(title: "ARTICLES 1", image: "assets/images/news.jpg"));
    _kreditPensiunNewsList
        .add(new Titled(title: "ARTICLES 2", image: "assets/images/news.jpg"));
    _kreditPensiunNewsList
        .add(new Titled(title: "ARTICLES 3", image: "assets/images/news.jpg"));
    _kreditPensiunNewsList
        .add(new Titled(title: "ARTICLES 4", image: "assets/images/news.jpg"));
    _kreditPensiunNewsList
        .add(new Titled(title: "ARTICLES 5", image: "assets/images/news.jpg"));

    _kreditPensiunTipsList
        .add(new Titled(title: "TIPS 1", image: "assets/images/tips.png"));
    _kreditPensiunTipsList
        .add(new Titled(title: "TIPS 2", image: "assets/images/tips.png"));
    _kreditPensiunTipsList
        .add(new Titled(title: "TIPS 3", image: "assets/images/tips.png"));
    _kreditPensiunTipsList
        .add(new Titled(title: "TIPS 4", image: "assets/images/tips.png"));
    _kreditPensiunTipsList
        .add(new Titled(title: "TIPS 5", image: "assets/images/tips.png"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: NabasaAppBar(),
      backgroundColor: KreditPensiunPalette.grey,
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _buildBannerMenu(),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Layanan Utama Kredit",
                          style: TextStyle(
                            fontFamily: "Montserrat Regular",
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildKreditPensiunMenu(),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Top Up dan Tagihan",
                          style: TextStyle(
                            fontFamily: "Montserrat Regular",
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTopUpTagihanMenu()
                ],
              ),
            ),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[
                    _buildKreditPensiunFeatured(),
                  ],
                )),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[_buildKreditPensiunNews()],
                )),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[_buildKreditPensiunTips()],
                )),
          ],
        ),
      ),
    ));
  }

  Widget _buildKreditPensiunMenux() {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.0),
                    topRight: Radius.circular(3.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Utility",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Text(
                    "Rp. 120.000",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/icon_transfer.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Transfer",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/icon_scan.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Scan QR",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/icon_saldo.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Isi Saldo",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/icon_menu.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Lainnya",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBannerMenu() {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                color: Colors.grey,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }

  Widget _buildKreditPensiunMenu() {
    return SizedBox(
        width: double.infinity,
        height: 120.0,
        child: Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: 4,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, position) {
                return _rowKreditPensiunService(
                    _kreditPensiunServiceList[position]);
              },
            )));
  }

  Widget _buildTopUpTagihanMenu() {
    return SizedBox(
        width: double.infinity,
        height: 120.0,
        child: Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: 4,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, position) {
                return _rowKreditPensiunService(_topUpTagihanList[position]);
              },
            )));
  }

  Widget _rowKreditPensiunService(Titled titled) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: KreditPensiunPalette.grey200, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    padding: EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        switch (titled.title) {
                          case "Pegawai Aktif":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PegawaiAktifScreen('Pegawai Aktif')));
                            break;
                          case "Pra Pensiunan":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PrapensiunScreen('Pra Pensiunan')));
                            break;
                          case "Pensiunan":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PensiunanScreen(
                                  'Pensiunan',
                                  widget.namaLengkap,
                                  widget.gajiPerbulan,
                                  widget.tanggalLahir,
                                  widget.bankGaji,
                                ),
                              ),
                            );
                            break;
                          case "Platinum":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PlatinumScreen('Platinum')));
                            break;
                          case "Pulsa":
                            underMaintance();
                            break;
                          case "PLN":
                            underMaintance();
                            break;
                          case "Paket Data":
                            underMaintance();
                            break;
                          case "Voucher Game":
                            underMaintance();
                            break;
                        }
                      },
                      child: Image.asset(
                        titled.image,
                        width: 32.0,
                        height: 32.0,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                ),
                Text(titled.title,
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: 'Montserrat Regular'))
              ],
            ),
          )
        ],
      ),
    );
  }

  underMaintance() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Under maintance'),
        );
      },
    );
  }

  Widget _buildKreditPensiunFeatured() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "News",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            "Best of Choice",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          SizedBox(
            height: 172.0,
            child: ListView.builder(
              itemCount: _kreditPensiunFeaturedList.length,
              padding: EdgeInsets.only(top: 12.0),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _rowKreditPensiunFeatured(
                    _kreditPensiunFeaturedList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _rowKreditPensiunFeatured(Titled titled) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              titled.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            titled.title,
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ],
      ),
    );
  }

  Widget _buildKreditPensiunNews() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Articles",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            "Hot Articles",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          SizedBox(
            height: 172.0,
            child: ListView.builder(
              itemCount: _kreditPensiunNewsList.length,
              padding: EdgeInsets.only(top: 12.0),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _rowKreditPensiunNews(_kreditPensiunNewsList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _rowKreditPensiunNews(Titled titled) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              titled.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0),
          ),
          Text(
            titled.title,
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ],
      ),
    );
  }

  Widget _buildKreditPensiunTips() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Tips for pensions",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            "Best of Tips",
            style: TextStyle(
              fontFamily: "Montserrat Regular",
            ),
          ),
          SizedBox(
            height: 172.0,
            child: ListView.builder(
              itemCount: _kreditPensiunTipsList.length,
              padding: EdgeInsets.only(top: 12.0),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _rowKreditPensiunTips(_kreditPensiunTipsList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _rowKreditPensiunTips(Titled titled) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              titled.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0),
          ),
          Text(
            titled.title,
            style: TextStyle(fontFamily: 'Montserrat Regular'),
          ),
        ],
      ),
    );
  }
}
