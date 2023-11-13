import 'package:flutter/material.dart';
import 'package:flutter_entreprises/models/Company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter une entreprise',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Icon(Icons.business, color: Colors.grey),
                      hintText: 'Nom de l\'entreprise',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _textFieldController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir le nom de l\'entreprise';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final String name = _textFieldController.text;
                      if (_formKey.currentState!.validate()) {
                        Company company = Company(0, name);
                        Navigator.of(context).pop(company);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    child: const Text(
                      'Valider',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ));
  }
}
