class MAnimal {
  int? id;
  String? name;
  String? kingdom;
  String? phylum;
  String? classname;
  String? order;
  String? family;
  String? genus;
  String? scientificname;

  MAnimal(
      {this.id,
      this.name,
      this.kingdom,
      this.phylum,
      this.classname,
      this.order,
      this.family,
      this.genus,
      this.scientificname});

  MAnimal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kingdom = json['kingdom'];
    phylum = json['phylum'];
    classname = json['classname'];
    order = json['order'];
    family = json['family'];
    genus = json['genus'];
    scientificname = json['scientificname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['kingdom'] = kingdom;
    data['phylum'] = phylum;
    data['classname'] = classname;
    data['order'] = order;
    data['family'] = family;
    data['genus'] = genus;
    data['scientificname'] = scientificname;
    return data;
  }
}
