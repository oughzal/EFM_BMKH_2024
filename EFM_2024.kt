open abstract class Empolye(var matricule:Int , var nom:String , var prenom:String,var dateNaissance:Date){
    open override fun toString():String{
        return "matricule $matricule \n le nom : $nom \n le prenom $prenom \n date de naissance : $dateNaissance"
    }
    abstract fun getSalaire():Double;

}

class Ouvrier( matricule:Int ,  nom:String ,  prenom:String, dateNaissance:Date,var dateEntre:Date) : Empolye( matricule,  nom ,  prenom,dateNaissance){

    companion object {
         const val SMIG : Double=2500.0
    }
          override fun toString():String{
               return super.toString()+"\ndateEntre:$dateEntre";
          }
          
          override fun getSalaire():Double{
                 val a = LocalDate.now().year-dateEntre.year;
                 val salaire=SMIG*a*100 
                 return salaire if salaire<2*SMIG else 2*SMIG 

          }
}
class Cadr( matricule:Int ,  nom:String ,  prenom:String, dateNaissance:Date,var indice:Int) : Empolye( matricule,  nom ,  prenom,dateNaissance){
     override fun toString():String{
               return super.toString()+"\nindice:$indice";
          }
           override fun getSalaire():Double{
                 
                 val salaire = when(indice){
                    1 -> 13000
                    2 -> 15000
                    3 -> 17000
                    4 ->  20000
                    else -> 0
                 }

                 when(indice){
                    1 -> return 13000 
                    2 -> return 15000
                    3 -> return 17000
                    4 -> return  20000
                    else -> return 0
                 }

          }
}
class Patron(matricule:Int ,  nom:String ,  prenom:String, dateNaissance:Date,var pourcentage:Double):Empolye(matricule,  nom ,  prenom,dateNaissance){
     override fun toString():String{
               return super.toString()+"\nPourcentage: $pourcentage\nChiffre d affaire:$chiffreAffaire";
          }
          companion object{
            final var chiffreAffaire=0
          }
          override fun getSalaire(){
            return chiffreAffaire*pourcentage/100
          }
}

Empolye.calculerAge():int{
    return LocalDate.now().year - this.dateNaissance.year
}