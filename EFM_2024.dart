
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
    double salaire = (DateTime.now().year - _dateEntrer.year) * SMIG;
    return (salaire > SMIG * 2) ? SMIG * 2 : salaire;
  }
}

class Cadre extends Employee {
  int _indice = 0;
  Cadre(int matricule, String nom, String prenom, DateTime dateNaissance,this._indice) : super(matricule, nom, prenom, dateNaissance);
  int get indice => _indice;
  set indice(int value) => _indice = value;

  @override
  String toString() {
    return super.toString() + " \n Indice : $indice";
  }

  @override
  double getSalaire() {
    switch (_indice) {
      case 1:
        return 13000;
      case 2:
        return 15000;
      case 3:
        return 17000;
      case 4:
        return 20000;
      default:
        return 0;
    }
  }
}

class Patron extends Employee {
  static final int Chiffre_Affaire = 0;
  double _pourcentage = 0;
  Patron(int matricule, String nom, String prenom, DateTime dateNaissance,
      this._pourcentage) : super(matricule, nom, prenom, dateNaissance);
  double get pourcentage => _pourcentage;
  set pourcentage(double value) => _pourcentage = value;

  @override
  String toString() {
    return super.toString() + "\n Pourcentage : $_pourcentage";
  }

  @override
  double getSalaire() {
    return Chiffre_Affaire * pourcentage / 100;
  }
}

void main(List<String> args) {
  Cadre cadre = Cadre(1, "nom", "prenom", DateTime(2000, 10, 4), 1);
  print(cadre);
  print(cadre.getSalaire());

}
