import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final inpCtrl = TextEditingController();
  List<dynamic> chatData = [
    // {"role": "user", "text": "Hello"},
    // {"role": "model", "text": "Hi"}
  ];

  dynamic data;
  bool _isloading = false;

  Future<void> getAIResponse(String query) async {
    chatData.add({
      "role": "user",
      "parts": [
        {"text": query}
      ]
    });

    setState(() {
      _isloading = true;
      data = null;
    });
    try {
      const url =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=";
      final body = {
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": query}
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0.9,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 2048,
          "stopSequences": []
        },
        "safetySettings": [
          {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          }
        ]
      };
      final res = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));
      if (res.statusCode == 200) {
        inpCtrl.clear();
        print(res.body);
        setState(() {
          data = jsonDecode(res.body)["candidates"][0]["content"];
          chatData.add(data);
        });
      }
      setState(() {
        _isloading = false;
      });
    } catch (err) {
      setState(() {
        _isloading = false;
      });
      throw Exception(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "data:image/jpeg;base64,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")),
          Column(
            children: [
              const Center(
                  child: Text(
                "MAYA",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: chatData.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: chatData[index]["role"] == "user"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: chatData[index]["role"] == "user"
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Visibility(
                              visible: chatData[index]["role"] == "model",
                              replacement: const SizedBox(
                                width: 50,
                              ),
                              child: const Icon(
                                Icons.android_outlined,
                                color: Colors.white,
                              )),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  chatData[index]["parts"][0]["text"],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: chatData[index]["role"] == "user",
                              replacement: const SizedBox(
                                width: 50,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 8,
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: TextField(
                    controller: inpCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Visibility(
                    visible: !_isloading,
                    replacement: const CircularProgressIndicator(),
                    child: IconButton(
                        onPressed: () async {
                          if (inpCtrl.text.trim().isNotEmpty) {
                            await getAIResponse(inpCtrl.text.trim());
                          }
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ],
      ),
    );
  }
}
