import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomcontrol/screens/bedroom_screen.dart';
import 'package:roomcontrol/screens/control_panel_screen.dart';
import 'package:roomcontrol/screens/house_panel_screen.dart';
import 'package:roomcontrol/screens/settings_screen.dart';
import 'package:roomcontrol/support_files/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _bodyWidget = Container();
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          setControlPanelScreen();
          break;
        case 1:
          setState(() {
            _bodyWidget = HousePanelScreenWidget();
          });
          break;
        case 2:
          setState(() {
            _bodyWidget = SettingsScreenWidget();
          });
          break;
        default:
          _bodyWidget = Container();
          break;
      }
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void setControlPanelScreen() {
    setState(() {
      _bodyWidget = ControlPanelScreenWidget(
        onBedRoomSelected: () {
          Navigator.pushNamed(context, BedRoomScreen.id);
        },
        onLivingRoomSelected: () {
          print('2');
        },
        onKitchenSelected: () {
          print('3');
        },
        onBathRoomSelected: () {
          print('4');
        },
        onOutdoorSelected: () {
          print('5');
        },
        onBalconySelected: () {
          print('6');
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setControlPanelScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(
          decoration: kBgView,
          child: SafeArea(
            child: _bodyWidget,
          ),
        ),
        onWillPop: _onWillPop,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset('images/bulb.png'), title: Text('')),
          BottomNavigationBarItem(
              icon: Image.asset('images/home.png'), title: Text('')),
          BottomNavigationBarItem(
              icon: Image.asset('images/settings.png'), title: Text(''))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}
