import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Notificações'),
      ),
      body: SafeArea(
        child: service.itemsCount == 0
            ? const Center(
                child: Text(
                  'Nenhuma Notificação!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: service.itemsCount,
                itemBuilder: (context, index) => ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].body),
                  onTap: (() => service.remove(index)),
                ),
              ),
      ),
    );
  }
}
