import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xFF3A2570),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE9BBFF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'SV',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'HaggleX',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF48337C),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          CupertinoIcons.bell_fill,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Total portfolio balance',
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
                Row(
                  children: [
                    Text(
                      '\$****',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(120),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 100,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/background.png',
                                ),
                                fit: BoxFit.cover),
                          ),
                          height: 100,
                          width: 300,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Markets',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/usdt.svg',
                                        height: 40,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Haggle(HAG)'),
                                        Row(
                                          children: [
                                            Text(
                                              'NGN 380',
                                              style: TextStyle(fontSize: 9),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '+ 2.34%',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SvgPicture.asset('assets/svg/graph.svg'),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: 7),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Do more with HaggleX',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              // color: Colors.red,
                            ),
                            height: 80,
                            child: Card(
                              elevation: 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEDEAF6),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/svg/message_down.svg',
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Send money instantly'),
                                        Text(
                                          'Send crypto to another wallet',
                                          style: TextStyle(fontSize: 9),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: 4),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Trending crypto news',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'Blockchain Bites: BTC on Ethereum, \nDeFi’s latest stablecoin, the currency cold wars',
                                          softWrap: true,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          // textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text('6hrs ago'),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('Category: DeFi'),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
