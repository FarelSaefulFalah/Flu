class Tag {
  bool? success;
  String? message;
  List<TagData>? data;

  Tag({this.success, this.message, this.data});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List).map((i) => TagData.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TagData {
  int? id;
  String? namaTag; // Changed from namaKategori to namaTag
  String? slug; // Added slug property
  String? createdAt;
  String? updatedAt;

  TagData({this.id, this.namaTag, this.slug, this.createdAt, this.updatedAt});

  factory TagData.fromJson(Map<String, dynamic> json) {
    return TagData(
      id: json['id'],
      namaTag: json['nama_tag'], // Changed from nama_kategori to nama_tag
      slug: json['slug'], // Added slug property
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['nama_tag'] = this.namaTag; // Changed from nama_kategori to nama_tag
    data['slug'] = this.slug; // Added slug property
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}