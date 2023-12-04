import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_entreprises/models/company.dart';
import 'package:flutter_entreprises/repositories/preferences_repository.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  final PreferencesRepository preferencesRepository;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    final List<Company> companies = await preferencesRepository.loadCompanies();
    emit(companies);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    preferencesRepository.saveCompanies([...state, company]);
    emit([...state, company]);
  }
}
