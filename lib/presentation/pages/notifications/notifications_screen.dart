import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/constants.dart';

enum NotificationType {
  system,
  event,
  update,
  holiday,
  limit,
  reminder,
  achievement,
}

class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime dateTime;
  final NotificationType type;
  final bool isRead;
  final String? actionRoute;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.dateTime,
    required this.type,
    this.isRead = false,
    this.actionRoute,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.system:
        return EvaIcons.infoOutline;
      case NotificationType.event:
        return EvaIcons.calendarOutline;
      case NotificationType.update:
        return EvaIcons.refreshOutline;
      case NotificationType.holiday:
        return EvaIcons.giftOutline;
      case NotificationType.limit:
        return EvaIcons.alertTriangleOutline;
      case NotificationType.reminder:
        return EvaIcons.clockOutline;
      case NotificationType.achievement:
        return EvaIcons.awardOutline;
    }
  }

  Color get color {
    switch (type) {
      case NotificationType.system:
        return Colors.blueGrey;
      case NotificationType.event:
        return Colors.blue;
      case NotificationType.update:
        return Colors.teal;
      case NotificationType.holiday:
        return Colors.deepPurple;
      case NotificationType.limit:
        return Colors.orange;
      case NotificationType.reminder:
        return Colors.amber;
      case NotificationType.achievement:
        return Colors.green;
    }
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Dữ liệu thông báo mẫu
  final List<Notification> _notifications = [
    Notification(
      id: '1',
      title: 'Chúc mừng năm mới 2025!',
      message:
          'Money Mate chúc bạn một năm mới tài lộc dồi dào, sức khỏe dồi dào và tiết kiệm hiệu quả!',
      dateTime: DateTime(2025, 1, 1, 0, 0),
      type: NotificationType.holiday,
    ),
    Notification(
      id: '2',
      title: 'Bạn đã đạt hạn mức chi tiêu!',
      message:
          'Danh mục "Ăn uống" đã vượt quá hạn mức 2.000.000đ. Hãy kiểm soát chi tiêu của bạn.',
      dateTime: DateTime.now().subtract(const Duration(hours: 3)),
      type: NotificationType.limit,
      actionRoute: RouteNames.category,
    ),
    Notification(
      id: '3',
      title: 'Bản cập nhật mới v2.0.5',
      message:
          'Money Mate vừa cập nhật với nhiều tính năng mới: phân tích chi tiêu theo AI, kết nối nhiều ngân hàng, và giao diện người dùng mới.',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      type: NotificationType.update,
    ),
    Notification(
      id: '4',
      title: 'Nhắc nhở thanh toán hóa đơn',
      message:
          'Bạn có một hóa đơn tiền điện cần thanh toán vào ngày mai. Giá trị: 580.000đ',
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
      type: NotificationType.reminder,
      isRead: true,
      actionRoute: '/notification',
    ),
    Notification(
      id: '5',
      title: 'Sự kiện khuyến mãi từ đối tác',
      message:
          'Ưu đãi đặc biệt dành cho người dùng Money Mate: Giảm 50.000đ cho lần đầu thanh toán qua ví điện tử MoMo.',
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      type: NotificationType.event,
      isRead: true,
    ),
    Notification(
      id: '6',
      title: 'Thành tựu mới!',
      message:
          'Chúc mừng! Bạn đã sử dụng Money Mate được 30 ngày liên tục. Tiếp tục duy trì thói quen tốt nhé!',
      dateTime: DateTime.now().subtract(const Duration(days: 7)),
      type: NotificationType.achievement,
      isRead: true,
    ),
    Notification(
      id: '7',
      title: 'Bảo mật tài khoản',
      message:
          'Chúng tôi phát hiện một đăng nhập lạ từ thiết bị mới. Nếu không phải bạn, hãy đổi mật khẩu ngay.',
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      type: NotificationType.system,
      isRead: true,
    ),
  ];

  bool _showUnreadOnly = false;
  NotificationType? _selectedType;

  List<Notification> get _filteredNotifications {
    return _notifications.where((notification) {
      // Lọc theo trạng thái đã đọc
      if (_showUnreadOnly && notification.isRead) {
        return false;
      }

      // Lọc theo loại thông báo
      if (_selectedType != null && notification.type != _selectedType) {
        return false;
      }

      return true;
    }).toList();
  }

  void _markAsRead(String id) {
    setState(() {
      final index =
          _notifications.indexWhere((notification) => notification.id == id);
      if (index != -1) {
        // Tạo bản sao của thông báo với trạng thái đã đọc
        final updatedNotification = Notification(
          id: _notifications[index].id,
          title: _notifications[index].title,
          message: _notifications[index].message,
          dateTime: _notifications[index].dateTime,
          type: _notifications[index].type,
          isRead: true,
          actionRoute: _notifications[index].actionRoute,
        );

        // Cập nhật danh sách thông báo
        _notifications[index] = updatedNotification;
      }
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (int i = 0; i < _notifications.length; i++) {
        if (!_notifications[i].isRead) {
          // Tạo bản sao của thông báo với trạng thái đã đọc
          final updatedNotification = Notification(
            id: _notifications[i].id,
            title: _notifications[i].title,
            message: _notifications[i].message,
            dateTime: _notifications[i].dateTime,
            type: _notifications[i].type,
            isRead: true,
            actionRoute: _notifications[i].actionRoute,
          );

          // Cập nhật danh sách thông báo
          _notifications[i] = updatedNotification;
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã đánh dấu tất cả thông báo là đã đọc'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lọc thông báo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(color: Colors.grey),

                  // Lọc theo trạng thái đã đọc
                  SwitchListTile(
                    title: const Text(
                      'Chỉ hiển thị chưa đọc',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: _showUnreadOnly,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setModalState(() {
                        _showUnreadOnly = value;
                      });
                      setState(() {
                        _showUnreadOnly = value;
                      });
                    },
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    'Loại thông báo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Danh sách loại thông báo
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('Tất cả'),
                        selected: _selectedType == null,
                        onSelected: (selected) {
                          setModalState(() {
                            _selectedType = null;
                          });
                          setState(() {
                            _selectedType = null;
                          });
                        },
                        backgroundColor: Colors.grey.shade800,
                        selectedColor: AppColors.primaryColor.withOpacity(0.3),
                        labelStyle: TextStyle(
                          color: _selectedType == null
                              ? Colors.white
                              : Colors.grey.shade400,
                        ),
                      ),
                      ...NotificationType.values.map((type) {
                        // Tạo tên hiển thị từ enum
                        String label;
                        switch (type) {
                          case NotificationType.system:
                            label = 'Hệ thống';
                            break;
                          case NotificationType.event:
                            label = 'Sự kiện';
                            break;
                          case NotificationType.update:
                            label = 'Cập nhật';
                            break;
                          case NotificationType.holiday:
                            label = 'Ngày lễ';
                            break;
                          case NotificationType.limit:
                            label = 'Hạn mức';
                            break;
                          case NotificationType.reminder:
                            label = 'Nhắc nhở';
                            break;
                          case NotificationType.achievement:
                            label = 'Thành tựu';
                            break;
                        }

                        return FilterChip(
                          label: Text(label),
                          selected: _selectedType == type,
                          onSelected: (selected) {
                            setModalState(() {
                              _selectedType = selected ? type : null;
                            });
                            setState(() {
                              _selectedType = selected ? type : null;
                            });
                          },
                          backgroundColor: Colors.grey.shade800,
                          selectedColor: Notification(
                            id: '',
                            title: '',
                            message: '',
                            dateTime: DateTime.now(),
                            type: type,
                          ).color.withOpacity(0.3),
                          labelStyle: TextStyle(
                            color: _selectedType == type
                                ? Colors.white
                                : Colors.grey.shade400,
                          ),
                        );
                      }).toList(),
                    ],
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Áp dụng'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = _notifications.where((n) => !n.isRead).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(EvaIcons.menu2Outline),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const AppDrawer(currentRoute: RouteNames.notifications),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.storySetNotiEmpty, width: 200, height: 200),
            AppDimens.spaceMd,
            const Text('Bạn không có thông báo nào')
          ],
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: AppBar(
    //     title: const Text('Thông báo'),
    //     leading: Builder(
    //       builder: (context) {
    //         return IconButton(
    //           icon: const Icon(EvaIcons.menu2Outline),
    //           onPressed: () {
    //             Scaffold.of(context).openDrawer();
    //           },
    //         );
    //       },
    //     ),
    //     actions: [
    //       // Nút lọc
    //       IconButton(
    //         icon: const Icon(EvaIcons.funnelOutline),
    //         onPressed: _showFilterBottomSheet,
    //       ),
    //       // Nút đánh dấu tất cả là đã đọc
    //       if (unreadCount > 0)
    //         IconButton(
    //           icon: const Icon(EvaIcons.checkmarkSquare2Outline),
    //           onPressed: _markAllAsRead,
    //           tooltip: 'Đánh dấu tất cả là đã đọc',
    //         ),
    //     ],
    //   ),
    //   drawer: const AppDrawer(currentRoute: RouteNames.notifications),
    //   body: _filteredNotifications.isEmpty
    //       ? Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Icon(
    //                 EvaIcons.bellOffOutline,
    //                 size: 64,
    //                 color: Colors.grey.shade600,
    //               ),
    //               const SizedBox(height: 16),
    //               Text(
    //                 _showUnreadOnly
    //                     ? 'Không có thông báo chưa đọc'
    //                     : _selectedType != null
    //                         ? 'Không có thông báo loại này'
    //                         : 'Không có thông báo nào',
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   color: Colors.grey.shade500,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //       : ListView.separated(
    //           padding: const EdgeInsets.all(16),
    //           itemCount: _filteredNotifications.length,
    //           separatorBuilder: (context, index) => const SizedBox(height: 12),
    //           itemBuilder: (context, index) {
    //             final notification = _filteredNotifications[index];

    //             // Format thời gian thông báo
    //             String formattedTime;
    //             final now = DateTime.now();
    //             final difference = now.difference(notification.dateTime);

    //             if (difference.inDays > 7) {
    //               // Hiển thị ngày tháng nếu quá 7 ngày
    //               formattedTime = DateFormat('dd/MM/yyyy').format(notification.dateTime);
    //             } else if (difference.inDays > 0) {
    //               // Hiển thị số ngày trước
    //               formattedTime = '${difference.inDays} ngày trước';
    //             } else if (difference.inHours > 0) {
    //               // Hiển thị số giờ trước
    //               formattedTime = '${difference.inHours} giờ trước';
    //             } else if (difference.inMinutes > 0) {
    //               // Hiển thị số phút trước
    //               formattedTime = '${difference.inMinutes} phút trước';
    //             } else {
    //               // Vừa xong
    //               formattedTime = 'Vừa xong';
    //             }

    //             return InkWell(
    //               onTap: () {
    //                 // Đánh dấu thông báo là đã đọc
    //                 if (!notification.isRead) {
    //                   _markAsRead(notification.id);
    //                 }

    //                 // Nếu có route hành động, điều hướng tới đó
    //                 if (notification.actionRoute != null) {
    //                   Navigator.pushNamed(context, notification.actionRoute!);
    //                 }
    //               },
    //               borderRadius: BorderRadius.circular(16),
    //               child: Container(
    //                 padding: const EdgeInsets.all(16),
    //                 decoration: BoxDecoration(
    //                   color: notification.isRead
    //                       ? Colors.grey.shade900
    //                       : Colors.grey.shade800,
    //                   borderRadius: BorderRadius.circular(16),
    //                   border: Border.all(
    //                     color: notification.isRead
    //                         ? Colors.transparent
    //                         : notification.color.withOpacity(0.5),
    //                     width: 1,
    //                   ),
    //                 ),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     // Icon loại thông báo
    //                     Container(
    //                       padding: const EdgeInsets.all(10),
    //                       decoration: BoxDecoration(
    //                         color: notification.color.withOpacity(0.1),
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: Icon(
    //                         notification.icon,
    //                         color: notification.color,
    //                         size: 24,
    //                       ),
    //                     ),
    //                     const SizedBox(width: 12),

    //                     // Nội dung thông báo
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               // Tiêu đề thông báo
    //                               Expanded(
    //                                 child: Text(
    //                                   notification.title,
    //                                   style: TextStyle(
    //                                     fontSize: 16,
    //                                     fontWeight: notification.isRead
    //                                         ? FontWeight.normal
    //                                         : FontWeight.bold,
    //                                     color: Colors.white,
    //                                   ),
    //                                 ),
    //                               ),

    //                               // Chỉ báo chưa đọc
    //                               if (!notification.isRead)
    //                                 Container(
    //                                   width: 8,
    //                                   height: 8,
    //                                   decoration: BoxDecoration(
    //                                     color: notification.color,
    //                                     shape: BoxShape.circle,
    //                                   ),
    //                                 ),
    //                             ],
    //                           ),
    //                           const SizedBox(height: 6),

    //                           // Nội dung thông báo
    //                           Text(
    //                             notification.message,
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                               color: Colors.grey.shade300,
    //                             ),
    //                           ),
    //                           const SizedBox(height: 8),

    //                           // Thời gian thông báo
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 formattedTime,
    //                                 style: TextStyle(
    //                                   fontSize: 12,
    //                                   color: Colors.grey.shade500,
    //                                 ),
    //                               ),

    //                               // Mũi tên nếu có hành động
    //                               if (notification.actionRoute != null)
    //                                 Icon(
    //                                   EvaIcons.arrowForwardOutline,
    //                                   size: 16,
    //                                   color: Colors.grey.shade500,
    //                                 ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    // );
  }
}
