import 'dart:convert';
import 'dart:io';

abstract class Printable {
  void printInfo();
}

class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('Dog barks');
  }

  @override
  void printInfo() {
    print('Name: $name, Breed: $breed');
  }
}
Dog initializeDogFromFile(String filename) {
  File file = File(filename);
  String contents = file.readAsStringSync();
  Map<String, dynamic> data = jsonDecode(contents);
  return Dog(data['name'], data['breed']);
}

void printNumbers(int n) {
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

void main() {
  Dog myDog = initializeDogFromFile('dog_data.json');

  myDog.makeSound();

  myDog.printInfo();

  printNumbers(5);
}
