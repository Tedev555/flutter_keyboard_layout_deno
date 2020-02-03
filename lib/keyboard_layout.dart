import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KeyboardLayout extends StatefulWidget {
  @override
  _KeyboardLayoutState createState() => _KeyboardLayoutState();
}

class _KeyboardLayoutState extends State<KeyboardLayout> {
  final numFormat = new NumberFormat("#,###.###");
  List<Map<String, dynamic>> _btnProps = [
    {'text': '7'},
    {'text': '8'},
    {'text': '9'},
    {'text': '4'},
    {'text': '5'},
    {'text': '6'},
    {'text': '1'},
    {'text': '2'},
    {'text': '3'},
    {'text': '.'},
    {'text': '0'},
    {'text': 'D'},
  ];
  String _showText = '0';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildNumberTextField(),
        GridView.count(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 3,
            children: List.generate(_btnProps.length, (index) {
              return index != 11 ? _buildKeyboardBtn(index) : _buildDeleteBtn();
            }))
      ],
    );
  }

  Widget _buildKeyboardBtn(index) {
    return InkWell(
      onTap: () {
        setState(() {
          _showText = _showText + '${_btnProps[index]['text']}';
        });
      },
      child: Card(
        child: Container(
          child: Center(
              child: Text('${_btnProps[index]['text']}',
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  Widget _buildDeleteBtn() {
    return InkWell(
        onTap: () {
          setState(() {
            if (_showText.length == 1) {
              _showText = '0';
            } else {
              _showText = _showText.substring(0, _showText.length - 1);
            }
          });
        },
        child: Card(
          child: Container(
            child: Center(
              child: Icon(Icons.backspace),
            ),
          ),
        ));
  }

  Widget _buildNumberTextField() {
    return Container(
      margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
      padding:
          EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _showText = '0';
              });
            },
            child: Container(
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
//          Text(numFormat.format(double.parse(_showText)),
          Text(numFormat.format(double.parse(_showText)),
              style: TextStyle(color: Colors.white, fontSize: 40.0)),
        ],
      ),
    );
  }
}
