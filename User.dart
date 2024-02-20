class User {
  String nom = "";
  String address = "";
  int age = 0;
  User(this.nom, this.address, this.age);
}

class Doctor extends User {
  String speciality = "";
  Doctor(String nom, String address, int age, this.speciality)
      : super(nom, address, age);
}

class Patient extends User {
  String sickness = "";
  Patient(String nom, String address, int age, this.sickness)
      : super(nom, address, age);
}
