import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

void signOutGoogle() async {
  await googleSignIn.signOut();
  // var prefs = await SharedPreferences.getInstance();
  // prefs.setString('token', "0");
  // print("User Sign Out");
}

class _ProductPageState extends State<ProductPage> {
  var _auth = FirebaseAuth.instance;

  bool _img1 = false;
  bool _img2 = false;
  bool _img3 = false;
  bool _img4 = false;

  var urlImage1, urlImage2, urlImage3, urlImage4;

  @override
  Widget build(BuildContext context) {
    print("build started");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Text("clothes"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            new IconButton(
              icon: new Icon(Icons.exit_to_app),
              onPressed: () {
                _auth.signOut();
                signOutGoogle();

                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  var ref = FirebaseStorage.instance.ref();
                  var refs1 = ref.child('myimages/l1.jpeg');
                  urlImage1 = await refs1.getDownloadURL();
                  var refs2 = ref.child('myimages/l2.jpeg');
                  urlImage2 = await refs2.getDownloadURL();
                  var refs3 = ref.child('myimages/l5.jpeg');
                  urlImage3 = await refs3.getDownloadURL();
                  var refs4 = ref.child('myimages/l4.jpeg');
                  urlImage4 = await refs4.getDownloadURL();
                  print(urlImage1);
                  setState(() {
                    print("set state started");
                    _img1 = true;
                     _img2 = true;
                    _img3 = true;
                    _img4 = true;
                  });
                },
                child: Text("show products"),
              ),
              _img1 ? getContainer(urlImage1, "52") : Container(),
              SizedBox(
                height: 25,
              ),
              _img2 ? getContainer(urlImage2, "42") : Container(),
              SizedBox(
                height: 25,
              ),
              _img3 ? getContainer(urlImage3, "62") : Container(),
              SizedBox(
                height: 25,
              ),
              _img4 ? getContainer(urlImage4, "89") : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getProducts(var url) {
  return Container(child: Image.network(url));
}

Widget getContainer(var picurl, var price) {
  print("get container started");
  return Container(
    child: Column(
      children: <Widget>[
        getProducts(picurl),
        Center(
          child: Container(
            child: Row(
              children: <Widget>[
                Text(
                  "price : $price\$",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {},
                  child: new Text("Add"),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
