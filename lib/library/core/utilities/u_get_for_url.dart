class UGetForUrl {
  String encodeLink(String value) {
    List<String> listSplit = value.split("/");
    List<String> encodedList = [];
    for (var element in listSplit) {
      encodedList.add(Uri.encodeComponent(element));
    }

    if (encodedList.first == "https%3A") {
      encodedList.first = "https:";
    }

    if (encodedList.first == "http%3A") {
      encodedList.first = "http:";
    }

    if (value.contains("//") && !value.contains("http")) {
      encodedList.insert(0, "https:");
    }

    String result = encodedList.join("/");

    result = result.replaceFirst("///", "//");

    return result;
  }
}
