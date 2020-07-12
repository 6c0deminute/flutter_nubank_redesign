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
        home: NubankHomePage());
  }
}

class NubankHomePage extends StatefulWidget {
  NubankHomePage({Key key}) : super(key: key);

  @override
  _NubankHomePageState createState() => _NubankHomePageState();
}

class _NubankHomePageState extends State<NubankHomePage> {
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
              onPressed: null),
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
              BottomDrawer()
            ],
          ),
        ),
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
      width: double.infinity,
      padding: EdgeInsets.only(top: 15),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.5,
            color: Colors.white.withAlpha(30),
          ),
          AccountBalance(),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Text(
                  "Actvities",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              padding: EdgeInsets.all(10),
              height: 400,
              child: Activities(),
            ),
          )
        ],
      ),
    );
  }
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key key}) : super(key: key);

  _buildAccountDetails({String value, String label}) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(style: TextStyle(color: Colors.white), children: [
              TextSpan(
                text: "\$",
                style: TextStyle(fontSize: 16),
              ),
              TextSpan(text: value, style: TextStyle(fontSize: 30))
            ]),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: _buildAccountDetails(
                  label: "Account Balance", value: "300.32")),
          Expanded(
              child: _buildAccountDetails(
                  label: "Current Bill", value: "1223.11")),
        ],
      ),
    );
  }
}

class Activities extends StatelessWidget {
  const Activities({Key key}) : super(key: key);

  _buildActivityItem(
      {String title,
      String subtitle,
      String trailing,
      IconData icon,
      Color color = Colors.black}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
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
          _buildActivityItem(
              title: "Uber Drive",
              subtitle: "\$ 5.32",
              trailing: "Today",
              icon: Icons.train),
          _buildActivityItem(
              title: "Mall",
              subtitle: "\$ 122.50",
              trailing: "Yesterday",
              icon: Icons.home),
          _buildActivityItem(
              title: "Expensive Tickets",
              subtitle: "\$ 399.99",
              trailing: "4 JUL",
              icon: Icons.airplanemode_active),
          _buildActivityItem(
              title: "Payment Received",
              subtitle: "\$  612.32",
              trailing: "1 JUL",
              icon: Icons.monetization_on,
              color: Colors.green[700]),
          _buildActivityItem(
              title: "Bill closed",
              subtitle: "\$  612.32",
              trailing: "1 JUL",
              icon: Icons.monetization_on,
              color: Colors.red[700]),
          _buildActivityItem(
              title: "Uber",
              subtitle: "\$ 12.32",
              trailing: "27 JUN",
              icon: Icons.monetization_on),
          _buildActivityItem(
              title: "Uber",
              subtitle: "\$ 14.50",
              trailing: "27 JUN",
              icon: Icons.monetization_on)
        ],
      ),
    );
  }
}

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.18,
        maxChildSize: 0.613,
        minChildSize: 0.18,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
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
                      color: kPrimaryColor,
                    ),
                  ),
                  height: 30,
                ),
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
                                icon: Icons.money_off, label: "Split Value"),
                            OptionsItem(
                                icon: Icons.attach_money, label: "Donation"),
                            OptionsItem(
                                icon: Icons.thumb_up, label: "Leave Like")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                                icon: Icons.screen_share, label: "Loans"),
                            OptionsItem(
                                icon: Icons.assignment_late, label: "Charge"),
                            OptionsItem(
                                icon: Icons.credit_card, label: "Virtual Card")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(
                                icon: Icons.account_balance_wallet,
                                label: "Deposit"),
                            OptionsItem(icon: Icons.settings, label: "Please"),
                            OptionsItem(icon: Icons.help, label: "Subscribe")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OptionsItem(icon: Icons.lock, label: "Lock Card"),
                            OptionsItem(
                                icon: Icons.people, label: "Invite Friends"),
                            OptionsItem(
                                icon: Icons.add_shopping_cart,
                                label: "Set Limit")
                          ],
                        ),
                      ),
                    ],
                  ),
                )
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
