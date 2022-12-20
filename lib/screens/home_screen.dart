import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List _games = [];

  @override
  void initState() {
    super.initState();
    _getGames();
  }

  // Retrieve a list of installed games
  void _getGames() async {
    List games = [];
    // Get a list of installed applications
    List apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
    );
    // Filter the list to only include games
    games =
        apps.where((app) => app.category == ApplicationCategory.game).toList();
    setState(() {
      _games = games;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: GlassmorphicContainer(
            width: double.maxFinite,
            height: 60,
            borderRadius: 0,
            blur: 50,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: const [
                  0.1,
                  1,
                ]),
            borderGradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, Colors.transparent],
            ),
            child: Row(
              children: [],
            ),
          ),
        ),
        body: _games.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _games.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.memory(
                            _games[index] is ApplicationWithIcon
                                ? _games[index].icon
                                : null),
                        title: Text(_games[index].appName),
                        onTap: () async {
                          bool canOpen =
                              await canLaunch(_games[index].packageName);
                          if (canOpen) {
                            await DeviceApps.openApp(_games[index].packageName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Error launching ${_games[index].appName}'),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
