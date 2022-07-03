import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? crateDate;

  const Project({this.id, this.name, this.description, this.crateDate});

  Project.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        crateDate = json['crateDate'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'crateDate': crateDate,
      };

  @override
  List<Object?> get props => [id, name, description, crateDate];
}
