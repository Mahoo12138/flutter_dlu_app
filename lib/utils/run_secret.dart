String sortAsc(Map<String, dynamic> data) {
  var secretKey = '8d6c5b73a50d4707bd71c93882ddbc8b';
  var array = [];
  data.forEach((key, value) {
    if (key == "code_names") {
      array.add(key);
    }
    if (value == 0) {
      array.add(key);
    }
    if (value != '' && value != null && key != 'sign') {
      array.add(key);
    }

  });
  array.sort();
  var str = '';
  for (var i = 0; i < array.length; i++) {
    var temp = data[array[i]];
    if (temp is Map) {
      if (temp.isNotEmpty) {
        temp = sortAsc(temp);
      } else {
        temp.forEach((key, value) => {});
      }
    } else if (temp is List) {}
    str += '&' + array[i] + '=' + temp.toString();
    // print(str);
  }
  if (str.isNotEmpty) {
    if (str.contains("&key")) {
      return str.substring(1);
    } else {
      return str.substring(1) + '&key=' + secretKey;
    }
  } else {
    return 'key=' + secretKey;
  }
}

sort_ASCII() {}