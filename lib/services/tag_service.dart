import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tag_model.dart'; // Import the Tag model

class TagService {
  final String _baseUrl = 'https://movieapi.smkassalaambandung.sch.id/api'; // Update the base URL if needed

  // Fetch list of tags
  Future<Tag?> fetchTags() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/tag')); // Adjust endpoint if needed

      if (response.statusCode == 200) {
        return Tag.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load tags');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Add a new tag
  Future<bool> storeTag(String namaTag) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/tag'), // Adjust endpoint if needed
      headers: {
        'Content-Type': 'application/json', // Ensure the right content type
      },
      body: jsonEncode({
        'nama_tag': namaTag,
      }),
    );

    return response.statusCode == 201;
  }

  // Update an existing tag
  Future<bool> updateTag(int id, String namaTag) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/tag/$id'), // Adjust endpoint if needed
      headers: {
        'Content-Type': 'application/json', // Ensure the right content type
      },
      body: jsonEncode({
        'nama_tag': namaTag,
      }),
    );

    return response.statusCode == 200;
  }

  // Delete a tag
  Future<bool> deleteTag(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/tag/$id')); // Adjust endpoint if needed
    return response.statusCode == 200;
  }
}