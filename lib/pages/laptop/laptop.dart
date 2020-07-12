import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloWorld/models/laptop-model.dart';
import 'package:helloWorld/pages/laptop/laptop_list.dart';

class Laptop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Laptop();
  }
}

class _Laptop extends State<Laptop> {
  final clotheEdittingController = TextEditingController();
  final priceEdittingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  LaptopModel _laptop = new LaptopModel(name: '', price: 0);
  List<LaptopModel> _laptops = List<LaptopModel>();

  void _insetClothe() {
    if (_laptop.name.isEmpty || _laptop.price.isNaN || _laptop.price == 0) {
      return;
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Laptop: ${_laptop.name} | Price: ${_laptop.price}'),
        duration: Duration(seconds: 3),
      ));
      this.setState(() {
        _laptop.dateCreated = new DateTime.now();
        _laptops.add(_laptop);
        clotheEdittingController.text = '';
        priceEdittingController.text = '';
      });
      _laptop = new LaptopModel(name: '', price: 0);
      Navigator.of(context).pop(context);
    }
  }

  void _showModalButtonSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          padding: EdgeInsets.all(14),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: clotheEdittingController,
                    onChanged: (text) {
                      this.setState(() {
                        _laptop.name = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your clothes',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: priceEdittingController,
                    onChanged: (text) {
                      this.setState(() {
                        _laptop.price = double.tryParse(text).round() ?? 0;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your price',
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: const Text(
                            'Create',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            this._insetClothe();
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.red[400],
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () => Navigator.of(context).pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            this._showModalButtonSheet();
          }),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Laptop management',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print('Pressed me');
              },
            ),
          ],
          brightness: Brightness.light,
          ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: EdgeInsets.only(top: 16, right: 14, left: 14),
              child: Container(
                child: ClothesList(clothes: _laptops),
              )),
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
      ),
    );
  }
}
