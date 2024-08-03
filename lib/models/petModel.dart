class PetModel{
  String name='';
  String category='';
  String subCategory='';
  double weight=0.0;
  String weightUnit="";
  DateTime dob=DateTime.now();
  DateTime? adoptionDate;
  List<String> vaccinations=[];

  PetModel({
    required this.name,
    required this.category,
    required this.subCategory,
    required this.weight,
    required this.weightUnit,
    required this.dob,
    this.adoptionDate,
    required this.vaccinations
});

}