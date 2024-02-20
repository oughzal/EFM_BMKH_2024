import 'dart:_js_helper';

abstract class Employee {
  int _matricule = 0;
  String _nom = "";
  String _prenom = "";
  DateTime _dateNaissance = DateTime.now();
  Employee(this._matricule, this._nom, this._prenom, this._dateNaissance);

  int get matricule => _matricule;
  set matricule(int value) => _matricule = value;

  String get nom => _nom;
  set nom(String value) => _nom = value;

  String get prenom => _prenom;
  set prenom(String value) => _prenom = value;

  DateTime get dateNaissance => _dateNaissance;
  set dateNaissance(DateTime value) => _dateNaissance = value;
  @override
  String toString() {
    return "Matricule : $matricule \n Nom : $nom \n Prenom : $prenom \n Date de Naissance : $dateNaissance   ";
  }

  double getSalaire();
}

class Ouvrier extends Employee {
  DateTime _dateEntrer = new DateTime.now();
  static final double SMIG = 2500;

  Ouvrier(int matricule, String nom, String prenom, DateTime dateNaissance,
      this._dateEntrer)
      : super(matricule, nom, prenom, dateNaissance);

  @override
  String toString() {
    return super.toString() + "\n Date Enter $dateEntrer";
  }

  DateTime get dateEntrer => _dateEntrer;
  set dateEntrer(DateTime value) => _dateEntrer = value;

  @override
  double getSalaire() {
    double salaire = (DateTime.now().year - dateEntrer.year) * SMIG;
    return (salaire > SMIG * 2)? SMIG*2 : salaire ;
  }
}
