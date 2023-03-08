import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _message = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      await ChatService().save(_message, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (msg) => setState(() => _message = msg),
              decoration: const InputDecoration(
                labelText: 'Enviar mensagem...',
                // suffixIcon: Icon(Icons.abc_outlined),
                filled: true,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) {
                if (_message.trim().isNotEmpty) {
                  _sendMessage();
                }
              },
            ),
          ),
          const SizedBox(width: 7),
          IconButton(
            icon: const Icon(Icons.send_rounded),
            onPressed: _message.trim().isEmpty ? null : _sendMessage,
            style: IconButton.styleFrom(
              disabledBackgroundColor: Colors.grey.shade300,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
