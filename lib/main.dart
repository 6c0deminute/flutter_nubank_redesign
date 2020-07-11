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
                              label: "Dividir Valor",
                            ),
                            OptionsItem(
                              icon: Icons.attach_money,
                              label: "Doação",
                            ),
                            OptionsItem(
                              icon: Icons.mobile_screen_share,
                              label: "Recarga",
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
                                label: "Empréstimos", icon: Icons.screen_share),
                            OptionsItem(
                                label: "Cobrar", icon: Icons.assignment_late),
                            OptionsItem(
                              label: "Cartão Virtual",
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
                              label: "Depósito",
                              icon: Icons.account_balance_wallet,
                            ),
                            OptionsItem(
                              label: "Configurações",
                              icon: Icons.settings,
                            ),
                            OptionsItem(
                              label: "Ajuda",
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
                              label: "Bloquear Cartão",
                              icon: Icons.lock,
                            ),
                            OptionsItem(
                              label: "Indicar Amigos",
                              icon: Icons.people,
                            ),
                            OptionsItem(
                              label: "Ajustar Limite",
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
          Text(label, style: TextStyle(fontSize: 11),)
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
                style: TextStyle(fontSize: 31, color: Colors.white, fontWeight: FontWeight.bold),
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
                value: "323,50",
                label: "Minha Nuconta",
              )),
              Expanded(
                  child: BalanceDetails(
                value: "1500,32",
                label: "Fatura Atual",
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
              TextSpan(text: "R\$", style: TextStyle(fontSize: 16)),
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

  _buildActivityItem(String name, String value, String date, IconData icon) {
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
      trailing: Text(date),
    );
  }

  _buildActivityItemCustom(
      String name, String value, String date, IconData icon, Color color) {
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
        date,
        style: TextStyle(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildActivityItem("Uberbr Eats", "12,32", "Hoje", Icons.train),
          _buildActivityItem("Shopping do Brasil", "122,50", "Ontem", Icons.home),
          _buildActivityItem(
              "Viagem - Ubatuba", "399,99", "4 Jul", Icons.airplanemode_active),
          _buildActivityItemCustom("Pagamento Recebido", "612,32", "1 JUL",
              Icons.monetization_on, Colors.green[700]),
          _buildActivityItemCustom("Fatura Fechada", "612.32", "1 JUL",
              Icons.monetization_on, Colors.red[700]),
          _buildActivityItem(
              "Uber", "12,32", "27 JUN", Icons.monetization_on),
          _buildActivityItem(
              "Uber", "12,32", "27 JUN", Icons.monetization_on)
        ],
      ),
    );
  }
}
