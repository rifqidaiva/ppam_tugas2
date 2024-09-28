// Contoh awal data user dan pesan (Ujang & Asep)
List<Map<String, String>> messages = [
  {"from": "ujang", "to": "asep", "message": "Hai Asep"},
  {"from": "asep", "to": "ujang", "message": "Hai Ujang"},
  {"from": "ujang", "to": "asep", "message": "Apa kabar?"},
  {"from": "asep", "to": "ujang", "message": "Baik, kamu?"},
  {"from": "ujang", "to": "asep", "message": "Juga baik"},
  {"from": "asep", "to": "ujang", "message": "Oke"},
];

// Nama dan password user, bisa diganti atau ditambah sesuai kebutuhan
final Map<String, String> data = {
  "123210022": "123210022",
  "123210181": "123210181",
  "ujang": "ujang123",
  "asep": "asep123",
  "osas": "osas123",
  "admin": "admin123",
};

class User {
  String username;
  User({required this.username});

  void pushMessage(String to, String message) {
    messages.add({"from": username, "to": to, "message": message});
  }

  List<Map<String, String>> getConversation(String friend) {
    return messages
        .where((element) =>
            (element["from"] == username && element["to"] == friend) ||
            (element["from"] == friend && element["to"] == username))
        .toList();
  }

  List<String> getFriendList() {
    return data.keys.where((key) => key != username).toList();
  }

  bool login(password) {
    var isPassed = data[username] == password;

    if (isPassed) {
      username = username;
    }
    return isPassed;
  }
}
