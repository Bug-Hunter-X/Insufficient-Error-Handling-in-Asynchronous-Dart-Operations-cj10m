```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, parse JSON
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    //Rethrow the exception to be handled further up the call stack
    rethrow;
  }
}
```