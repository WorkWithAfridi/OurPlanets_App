import 'package:flutter/material.dart';
import 'package:our_planets/Data.dart';
import 'package:our_planets/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 300,
                            ),
                            Text(
                              planetInfo.name,
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 56,
                                  color: const Color(0xff47455f),
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              planetInfo.distanceFromSun,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Avenir',
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.left,
                            ),
                            Divider(
                              color: Colors.black38,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              planetInfo.description,
                              // maxLines: 5,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: contentTextColor),
                            ),
                            // SizedBox(
                            //   height: 6.0,
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, // background
                                  onPrimary: Colors.transparent, // fo
                                  elevation: 0 // reground
                                  ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OpensWebView(planetInfo.name)));
                              },
                              // onPressed: () {
                              //   Navigator.push(
                              //       context,
                              //       PageRouteBuilder(
                              //           transitionDuration: Duration(milliseconds: 1000),
                              //           transitionsBuilder: (context, animation, animationTime, child) {
                              //             animation = CurvedAnimation( parent: animation,  curve:Curves.elasticInOut);
                              //             return ScaleTransition(
                              //               scale: animation,
                              //               child: child,
                              //               alignment: Alignment.center,
                              //             );
                              //           },
                              //           pageBuilder: (context, animation,
                              //               animationTime) {
                              //             return OpensWebView(planetInfo.name);
                              //           }));
                              // },
                              child: Text(
                                'View 3D model.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Avenir',
                                    fontSize: 15,
                                    color: primaryTextColor),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                        child: Divider(
                          color: Colors.black38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 5, bottom: 5),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0xff47555f),
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Container(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: planetInfo.images.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      planetInfo.images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -64,
                  child: Hero(
                      tag: planetInfo.position,
                      child: Image.asset(planetInfo.iconImage)),
                ),
                Positioned(
                  top: 60,
                  left: 32,
                  child: Text(
                    planetInfo.position.toString(),
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: primaryTextColor.withOpacity(0.09),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )));
  }
}

class OpensWebView extends StatelessWidget {
  late final String planetName;
  late String initialurl;
  late WebViewController webViewController;
  OpensWebView(this.planetName);
  @override
  Widget build(BuildContext context) {
    if (planetName == "Mercury") {
      initialurl = 'https://solarsystem.nasa.gov/planets/mercury/overview/';
    } else if (planetName == 'Venus') {
      initialurl = 'https://solarsystem.nasa.gov/planets/venus/overview/';
    } else if (planetName == 'Earth') {
      initialurl = 'https://solarsystem.nasa.gov/planets/earth/overview/';
    } else if (planetName == 'Mars') {
      initialurl = 'https://solarsystem.nasa.gov/planets/mars/overview/';
    } else if (planetName == 'Jupiter') {
      initialurl = 'https://solarsystem.nasa.gov/planets/jupiter/overview/';
    } else if (planetName == 'Saturn') {
      initialurl = 'https://solarsystem.nasa.gov/planets/saturn/overview/';
    } else if (planetName == 'Uranus') {
      initialurl = 'https://solarsystem.nasa.gov/planets/uranus/overview/';
    } else if (planetName == 'Neptune') {
      initialurl = 'https://solarsystem.nasa.gov/planets/neptune/overview/';
    } else {
      initialurl = 'https://solarsystem.nasa.gov/planets/overview/';
    }
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          String url = await webViewController.currentUrl();
          if (url == initialurl) {
            return true;
          } else {
            webViewController.goBack();
            return false;
          }
        },
        child: Scaffold(
            body: Container(
          child: SafeArea(
            child: WebView(
              initialUrl: initialurl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController wc) {
                webViewController = wc;
              },
            ),
          ),
        )),
      ),
    );
  }
}
