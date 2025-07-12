// class GetAllToDoModels {
//   int? _code;
//   bool? _success;
//   int? _timestamp;
//   String? _message;
//   List<Items>? _items;
//   Meta? _meta;

//   GetAllToDoModels({
//     int? code,
//     bool? success,
//     int? timestamp,
//     String? message,
//     List<Items>? items,
//     Meta? meta,
//   }) {
//     if (code != null) {
//       this._code = code;
//     }
//     if (success != null) {
//       this._success = success;
//     }
//     if (timestamp != null) {
//       this._timestamp = timestamp;
//     }
//     if (message != null) {
//       this._message = message;
//     }
//     if (items != null) {
//       this._items = items;
//     }
//     if (meta != null) {
//       this._meta = meta;
//     }
//   }

//   int? get code => _code;
//   set code(int? code) => _code = code;
//   bool? get success => _success;
//   set success(bool? success) => _success = success;
//   int? get timestamp => _timestamp;
//   set timestamp(int? timestamp) => _timestamp = timestamp;
//   String? get message => _message;
//   set message(String? message) => _message = message;
//   List<Items>? get items => _items;
//   set items(List<Items>? items) => _items = items;
//   Meta? get meta => _meta;
//   set meta(Meta? meta) => _meta = meta;

//   GetAllToDoModels.fromJson(Map<String, dynamic> json) {
//     _code = json['code'];
//     _success = json['success'];
//     _timestamp = json['timestamp'];
//     _message = json['message'];
//     if (json['items'] != null) {
//       _items = <Items>[];
//       json['items'].forEach((v) {
//         _items!.add(new Items.fromJson(v));
//       });
//     }
//     _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this._code;
//     data['success'] = this._success;
//     data['timestamp'] = this._timestamp;
//     data['message'] = this._message;
//     if (this._items != null) {
//       data['items'] = this._items!.map((v) => v.toJson()).toList();
//     }
//     if (this._meta != null) {
//       data['meta'] = this._meta!.toJson();
//     }
//     return data;
//   }
// }

// class Items {
//   String? _sId;
//   String? _title;
//   String? _description;
//   String? _isComplete;
//   String? _updatedAt;

//   Items({
//     String? sId,
//     String? title,
//     String? description,
//     String? isComplete,
//     String? updatedAt,
//   }) {
//     if (sId != null) {
//       this._sId = sId;
//     }
//     if (title != null) {
//       this._title = title;
//     }
//     if (description != null) {
//       this._description = description;
//     }
//     if (isComplete != null) {
//       this._isComplete = isComplete;
//     }
//     if (updatedAt != null) {
//       this._updatedAt = updatedAt;
//     }
//   }

//   String? get sId => _sId;
//   set sId(String? sId) => _sId = sId;
//   String? get title => _title;
//   set title(String? title) => _title = title;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//   String? get isComplete => _isComplete;
//   set isComplete(String? isComplete) => _isComplete = isComplete;
//   String? get updatedAt => _updatedAt;
//   set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

//   Items.fromJson(Map<String, dynamic> json) {
//     _sId = json['_id'];
//     _title = json['title'];
//     _description = json['description'];
//     _isComplete = json['is_complete'];
//     _updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this._sId;
//     data['title'] = this._title;
//     data['description'] = this._description;
//     data['is_complete'] = this._isComplete;
//     data['updated_at'] = this._updatedAt;
//     return data;
//   }
// }

// class Meta {
//   int? _totalItem;
//   int? _totalPages;
//   int? _perPageItem;

//   Meta({int? totalItem, int? totalPages, int? perPageItem}) {
//     if (totalItem != null) {
//       this._totalItem = totalItem;
//     }
//     if (totalPages != null) {
//       this._totalPages = totalPages;
//     }
//     if (perPageItem != null) {
//       this._perPageItem = perPageItem;
//     }
//   }

//   int? get totalItem => _totalItem;
//   set totalItem(int? totalItem) => _totalItem = totalItem;
//   int? get totalPages => _totalPages;
//   set totalPages(int? totalPages) => _totalPages = totalPages;
//   int? get perPageItem => _perPageItem;
//   set perPageItem(int? perPageItem) => _perPageItem = perPageItem;

//   Meta.fromJson(Map<String, dynamic> json) {
//     _totalItem = json['total_item'];
//     _totalPages = json['total_pages'];
//     _perPageItem = json['per_page_item'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_item'] = this._totalItem;
//     data['total_pages'] = this._totalPages;
//     data['per_page_item'] = this._perPageItem;
//     return data;
//   }
// }
