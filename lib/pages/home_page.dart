import 'package:flutter/material.dart';
import 'package:instamovie/pages/list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SearchForm(),
            ImdbLogo(),
          ],
        ),
      ),
    );
  }
}

class ImdbLogo extends StatelessWidget {
  const ImdbLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Powered by',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Image.asset('assets/logo_imdb.png')
        ],
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm();

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/logo_lg.png'),
        SizedBox(height: 30),
        TextFormField(
          controller: controller,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            labelText: 'Nome do filme',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FlatButton(
            color: Color(0xFF01B4E4),
            child: Text(
              'Pesquisar',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ListPage(controller.value.text),
                ),
              );
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        )
      ],
    );
  }
}
