class PokemonModel{
  String? id;
  String? name;
  String? link;
  PokemonModel.fromJson(json){
    name=json["name"];
    link=json["url"];
    id=Uri.parse(json["url"].toString()).pathSegments[3];
  }
}