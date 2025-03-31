import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _openAI = OpenAI.instance.build(
    token: "sk-baa4bbd6fc6d4e1482ddb3715a955d57",//"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",
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: "Ahmed", lastName: "Harfoush");
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: "Chat", lastName: "GPT");

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(
          0,
          166,
          126,
          1,
        ),
        title: const Text("Bixby",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _currentUser,
        typingUsers: _typingUsers,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Color.fromRGBO(
            0,
            166,
            126,
            1,
          ),
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m){
          getChatResponse(m);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async{
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });

    // List<Messages> _messagesHistory = _messages.reversed.map((m) {
    //   if(m.user == _currentUser){
    //     return Messages(role: Role.user, content: m.text);
    //   }else{
    //     return Messages(role: Role.assistant, content: m.text);
    //   }
    // }).toList();
    // final request = ChatCompleteText(
    //   model: GptTurbo0301ChatModel(),
    //   messages: _messagesHistory,
    //   maxToken: 200,
    // );

    List<Map<String, dynamic>> messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return {
          'role': 'user',
          'content': m.text,
        };
      } else {
        return {
          'role': 'assistant',
          'content': m.text,
        };
      }
    }).toList();

    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: messagesHistory,
      maxToken: 200,
    );

    final responce = await _openAI.onChatCompletion(request: request);
    for(var element in responce!.choices){
      if(element.message != null){
        setState(() {
          _messages.insert(0, ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
          ));
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}

