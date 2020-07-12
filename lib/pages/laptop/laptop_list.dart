import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloWorld/models/laptop-model.dart';
import 'package:helloWorld/utils/index.dart';
import 'package:intl/intl.dart';

class ClothesList extends StatelessWidget {
  final List<LaptopModel> clothes;
  ClothesList({this.clothes});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: this.clothes.length,
        itemBuilder: (context, index) {
          return Container(
              color: Colors.deepOrange[500],
              margin: EdgeInsets.only(top: 12),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          capitalize(this.clothes[index].name),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text(
                          DateFormat.yMMMd()
                              .format(this.clothes[index].dateCreated),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          child: Text(
                            '${this.clothes[index].price}\$',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}
