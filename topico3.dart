/*
Abstração: É o conceito que guia toda linguagem OO, trata-se da identidade, características, ações/eventos,
que um objeto real tem e a partir dessas informações o programador desenvolve a classe, recriando o objeto real
num objeto virtual (abstração).

Encapsulamento: Consiste em esconder as propriedades de uma classe (atributos e métodos),
com o objetivo de protegê-la (evita a manipulação indevida por outra porção
de código que não deveria, por exemplo, anular um atributo). Exemplo: uma aplicação bancária não deve manter
o atributo Saldo da classe Conta público, isso limita o escopo do programador que utiliza a classe.
Os getters e setters podem ser implementados com limites do que o programador pode ou não alterar.

Herança: A classe filha herda os atributos e métodos da classe pai, permite criar representações da vida real
de maneira organizada como uma hierarquia de classes. Exemplo: A classe cachorro herda características da classe
animal, a classe pato herda características da classe animal.

Polimorfismo: Trata-se da utilização do mesmo método para objetivos específicos de cada classe. Exemplo: 
a classe animal tem o método run() que pode ser sobrescrito pelas implementações das classes filhas.

Fonte: https://www.devmedia.com.br/os-4-pilares-da-programacao-orientada-a-objetos/9264
*/

//Abstração do objeto real animal
class Animal {
  //atributo privado permite ser acessado apenas pela própria classe.
  String _name;
  int _age;
  Animal(this._name, this._age);
  
  //getters e setters encapsulam os atributos da classe.
  void setName(String name) {
     this._name = name;
  }
  
  void setAge(int age) {
      this._age = age;
  }
  
  String getName() {
    return this._name;
  }
  
  int getAge() {
    return this._age;
  }
  
  void run() {}
}

//classe dog deriva da classe animal e herda atributos e métodos.
class Dog extends Animal {
  int _legs = 4;
  String _type = 'DOG';
  
  Dog(String name, int age) : super(name, age);
  
  void bark() {
    print('[${this._type}] ${this._name}(${this._age}) says: Au au!');
  }
  
  //sobrescreve a função da classe pai com outra implementação (polimorfismo).
  @override run() {
    print('[${this._type}] ${this._name}(${this._age}) is running (${this._legs} legs)!');
  }
}

//classe duck deriva da classe animal e herda atributos e métodos.
class Duck extends Animal {
  int _legs = 2;
  String _type = 'DUCK';
  
  Duck(String name, int age) : super(name, age);
  
  void quack() {
     print('[${this._type}] ${this._name}(${this._age}) says: Quack!');
  }
  
  //sobrescreve a função da classe pai com outra implementação (polimorfismo).
  @override run() {
    print('[${this._type}] ${this._name}(${this._age}) is running (${this._legs} legs)!');
  }
}

void main() {
  var dog = Dog("dog", 8);
  var duck = Duck('roberval', 4);
  
  duck.quack();
  duck.run();
  dog.bark();
  dog.run();
  
  duck.setAge(5);
  duck.setName('chimbinha');
  dog.setAge(12);
  dog.setName("roberto");
  
  print('');
  
  duck.run();
  duck.quack();
  dog.bark();
  dog.run();
}
