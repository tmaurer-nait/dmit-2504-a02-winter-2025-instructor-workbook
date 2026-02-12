// Simple model class with 3 attributes and a basic generative constructor

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  // This function turns a Map into a Dog
  // The map looks like this {'id': 0, 'name': 'Rover', 'age': 5}
  factory Dog.fromMap(Map<String, Object?> dogMap) {
    return Dog(
      id: dogMap['id'] as int,
      name: dogMap['name'] as String,
      age: dogMap['age'] as int,
    );
  }

  // This function turns a Dog into a Map
  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }
}
