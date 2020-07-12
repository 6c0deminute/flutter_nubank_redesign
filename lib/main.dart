import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF81249F);
Color kSecondaryColor = Color(0xFF9140A9);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NubankHome());
  }
}

class NubankHome extends StatefulWidget {
  const NubankHome({Key key}) : super(key: key);

  @override
  _NubankHomeState createState() => _NubankHomeState();
}

class _NubankHomeState extends State<NubankHome> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nubank"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        color: kPrimaryColor,
        child: NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            setState(() {
              opacity = notification.extent - 0.18;
            });
            return true;
          },
          child: Stack(
            children: <Widget>[
              AccountDetails(),
              IgnorePointer(
                child: Container(
                  color: Colors.purple.withOpacity(opacity),
                ),
              ),
              BottomDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.18,
        maxChildSize: 0.613,
        minChildSize: 0.18,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 3,
                        color: Colors.purple,
                      ),
                    ),
                    height: 30),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                              icon: Icons.money_off,
                              label: "Split Value",
                            ),
                            OptionsItem(
                              icon: Icons.attach_money,
                              label: "Donation",
                            ),
                            OptionsItem(
                              icon: Icons.thumb_up,
                              label: "Leave Like",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                                label: "Loans", icon: Icons.screen_share),
                            OptionsItem(
                                label: "Charge", icon: Icons.assignment_late),
                            OptionsItem(
                              label: "Virtual Card",
                              icon: Icons.credit_card,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                              label: "Deposit",
                              icon: Icons.account_balance_wallet,
                            ),
                            OptionsItem(
                              label: "Please",
                              icon: Icons.settings,
                            ),
                            OptionsItem(
                              label: "Subscribe",
                              icon: Icons.help,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                              label: "Lock Card",
                              icon: Icons.lock,
                            ),
                            OptionsItem(
                              label: "Invite Friends",
                              icon: Icons.people,
                            ),
                            OptionsItem(
                              label: "Set Limit",
                              icon: Icons.add_shopping_cart,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class OptionsItem extends StatelessWidget {
  const OptionsItem({Key key, this.icon, this.label}) : super(key: key);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
              width: 60,
              height: 60,
              color: kSecondaryColor,
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  "nubank_logo_white.png",
                  width: 30,
                  height: 30,
                ),
              ),
              Text(
                "CodeMinute",
                style: TextStyle(
                    fontSize: 31,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            thickness: 2.5,
            color: Colors.white.withAlpha(30),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: BalanceDetails(
                value: "323.50",
                label: "Account Balance",
              )),
              Expanded(
                  child: BalanceDetails(
                value: "1,500.32",
                label: "Current Bill",
              )),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Text("Activities", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 25),
                height: 400,
                child: Activity()),
          ),
        ],
      ),
    );
  }
}

class BalanceDetails extends StatelessWidget {
  const BalanceDetails(
      {Key key, this.value, this.label, this.color = Colors.white})
      : super(key: key);
  final String value;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      // color: Colors.white,
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(style: TextStyle(color: color), children: [
              TextSpan(text: "\$", style: TextStyle(fontSize: 16)),
              TextSpan(text: value, style: TextStyle(fontSize: 30))
            ]),
          ),
          Text(
            label,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({Key key}) : super(key: key);

  _buildActivityItemCustom(
      {String title,
      String subtitle,
      String trailing,
      IconData icon,
      Color color = Colors.black}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: color),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildActivityItemCustom(
              title: "Uberbr Eats",
              subtitle: "\$ 12.32",
              trailing: "Today",
              icon: Icons.train),
          _buildActivityItemCustom(
              title: "Mall",
              subtitle: "\$ 122.50",
              trailing: "Yesterday",
              icon: Icons.home),
          _buildActivityItemCustom(
              title: "Expensive Tickets",
              subtitle: "\$ 399.99",
              trailing: "4 JUL",
              icon: Icons.airplanemode_active),
          _buildActivityItemCustom(
              title: "Payment Received",
              subtitle: "\$  612.32",
              trailing: "1 JUL",
              icon: Icons.monetization_on,
              color: Colors.green[700]),
          _buildActivityItemCustom(
              title: "Bill closed",
              subtitle: "\$  612.32",
              trailing: "1 JUL",
              icon: Icons.monetization_on,
              color: Colors.red[700]),
          _buildActivityItemCustom(
              title: "Uber",
              subtitle: "\$ 12.32",
              trailing: "27 JUN",
              icon: Icons.monetization_on),
          _buildActivityItemCustom(
              title: "Uber",
              subtitle: "\$ 14.50",
              trailing: "27 JUN",
              icon: Icons.monetization_on)
        ],
      ),
    );
  }
}
