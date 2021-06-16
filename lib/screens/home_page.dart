import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'AGENDAR SERVICIO TÉCNICO',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              _.logoutLoading
                  ? Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.manage_accounts),
                          title: Text('Gestionar Usuario'),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Cerrar Sesión'),
                          onTap: _.logout,
                        ),
                      ],
                    ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Agendar',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Fotos',
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: 'Chat bot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus),
              label: 'Coronavirus',
            ),
          ],
          onTap: _.onTapButtonNavBar,
        ),
      ),
    );
  }
}
