import 'package:intl/intl.dart';

class Workshop {
  final int? id;
  final String? title;
  final String? type;
  final String? expertName;
  final double? mrp;
  final double? sellingPrice;
  final String? startDateTime;
  final String? thumbnail;

  Workshop({
     this.id,
     this.title,
     this.type,
     this.expertName,
     this.mrp,
     this.sellingPrice,
     this.startDateTime,
     this.thumbnail,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) {
    return Workshop(
      id: json['id'],
      title: json['title'],
      type: json['type']['title'],
      expertName: json['workshop_experts'][0]['first_name'] + " " + json['workshop_experts'][0]['last_name'],
      mrp: (json['mrp'] as num).toDouble(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
      startDateTime: _formatDateTime(json['start_date_time']),
      thumbnail: json['file'],
    );
  }

  static String _formatDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    return DateFormat("d'th' MMM yyyy, h:mm a").format(dateTime);
  }

  double get discountPercentage => (((mrp??0) - (sellingPrice??0)) / (mrp??0)) * 100;
}