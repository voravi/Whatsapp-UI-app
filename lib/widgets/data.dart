class Contact {
  String name = "";
  String msg = "";
  String image = "";

  Contact({required this.name, required this.msg, required this.image});
}

List<Contact> ContactList = [
  Contact(name: "Ravi", msg: "Hello Good Morning", image: "assets/man1.jpg"),
  Contact(name: "Raj", msg: "Hii", image: "assets/man2.jpg"),
  Contact(name: "Manoj", msg: "How can i help you?", image: "assets/man3.jpg"),
  Contact(name: "Rimansh", msg: "flutter go rock!!", image: "assets/man4.jpg"),
  Contact(name: "Om", msg: "How are you?", image: "assets/man5.jpg"),

];
