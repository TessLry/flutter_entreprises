import 'package:flutter/material.dart';
import 'package:flutter_entreprises/models/Company.dart';
import 'package:flutter_entreprises/models/address.dart';
import 'package:flutter_entreprises/router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    const Company('Entreprise 1', Address('Rue 1', 'Ville 1', '12345')),
    const Company('Entreprise 2', Address('Rue 2', 'Ville 2', '12345')),
    const Company('Entreprise 3', Address('Rue 3', 'Ville 3', '12345')),
  ];

  void _addCompany(Company company) {
    setState(() {
      _companies.add(company);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Liste des entreprises',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: ListView.separated(
          itemCount: _companies.length,
          itemBuilder: (BuildContext context, int index) {
            final company = _companies[index];
            return ListTile(
              title: Text(company.name),
              subtitle: Text(
                  '${company.address.street}, ${company.address.postcode} ${company.address.city}'),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 0);
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final Company? company = await Navigator.of(context)
                .pushNamed(AppRouter.addCompanyPage) as Company?;
            if (company != null) {
              _addCompany(company);
            }
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
