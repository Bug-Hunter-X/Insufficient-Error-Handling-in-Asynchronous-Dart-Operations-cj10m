```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // Handle specific HTTP error codes
      if(response.statusCode == 404){
        print('Resource not found (404)');
      } else if(response.statusCode == 500){
        print('Server error (500)');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
      return null; // Or throw a custom exception
    }
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: $e');
    return null; // Or throw a custom exception
  } on FormatException catch (e) {
    // Handle JSON parsing errors
    print('JSON parsing error: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    // Handle other exceptions
    print('Unexpected error: $e');
    return null; // Or throw a custom exception
  }
}
```