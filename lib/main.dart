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
        title: Text("Code Minute Nubank"),
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
              Container(
                color: Colors.purple.withOpacity(opacity),
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
        maxChildSize: 0.48,
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
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              icon: Icons.mobile_screen_share,
                              label: "Phone Bill",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            OptionsItem(
                              label: "Deposit",
                              icon: Icons.account_balance_wallet,
                            ),
                            OptionsItem(
                              label: "Settings",
                              icon: Icons.settings,
                            ),
                            OptionsItem(
                              label: "Help",
                              icon: Icons.help,
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
      height: 80,
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
          Text(label)
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
          Text(
            "Code Minute",
            style: TextStyle(fontSize: 31, color: Colors.white),
          ),
          Divider(
            thickness: 2.5,
            color: Colors.white.withAlpha(30),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: BalanceDetails(
                value: "323,50",
                label: "Account Balance",
              )),
              Expanded(
                  child: BalanceDetails(
                value: "1500,32",
                label: "Current Bill",
              )),
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
                margin: EdgeInsets.symmetric(vertical: 25),
                height: 400,
                child: Activity()),
          ),
        ],
      ),
    );
  }
}

class BalanceDetails extends StatelessWidget {
  const BalanceDetails({Key key, this.value, this.label, this.color = Colors.white}) : super(key: key);
  final String value;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: TextStyle(color: color),
              children: [
              TextSpan(text: "R\$", style: TextStyle(fontSize: 16)),
              TextSpan(text: value, style: TextStyle(fontSize: 30))
            ]),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({Key key}) : super(key: key);

  _buildActivityItem(String name, String value, IconData icon) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(icon),
      ),
      subtitle: Text("R\$ $value"),
      trailing: Text("June, 27th"),
    );
  }

  _buildActivityItemCustom(
      String name, String value, IconData icon, Color color) {
    return ListTile(
      title: Text(
        name,
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
        "R\$ $value",
        style: TextStyle(color: color),
      ),
      trailing: Text(
        "June, 27th",
        style: TextStyle(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildActivityItem("Uber", "12.32", Icons.train),
          _buildActivityItem("Mall", "122.50", Icons.home),
          _buildActivityItem(
              "Trip Airplane", "399.99", Icons.airplanemode_active),
          _buildActivityItemCustom(
              "Bill Due", "612.32", Icons.monetization_on, Colors.red[700]),
          _buildActivityItem("Uber", "12.32", Icons.monetization_on),
          _buildActivityItem("Uber", "12.32", Icons.monetization_on)
        ],
      ),
    );
  }
}
