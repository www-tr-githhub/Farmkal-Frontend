import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/Chatcontroller.dart';

class ChatScreen extends StatefulWidget {
  final String targetId, sourceId, targetname, userimage;
  final int roomindex;

  ChatScreen(
      {super.key,
      required this.targetId,
      required this.sourceId,
      required this.targetname,
      required this.userimage,
      required this.roomindex});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final _controller = TextEditingController();
  final ChatController _chatController = Get.find<ChatController>();

  Widget build(BuildContext context) {
    String? userimage = '';
    FocusNode _textFormFieldFocus = FocusNode();
    RxBool emojiShowing = false.obs;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/gif/images.jpeg'),
          ),
        ),
        title: Row(
          children: [
            Text("Name"),
            Spacer(),
            PopupMenuButton<String>(
              // iconColor: Colors.black,
              icon: const Icon(Icons.more_vert, color: Colors.black),
              offset: Offset(0, 60.0),
              color: Color.fromRGBO(239, 213, 255, 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Unmatch',
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_down,
                        size: 18,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Unmatch', style: GoogleFonts.poppins(fontSize: 13)),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Report Profile',
                  child: Row(
                    children: [
                      Icon(
                        Icons.report,
                        size: 18,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Report Profile',
                          style: GoogleFonts.poppins(fontSize: 13)),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Block',
                  child: Row(
                    children: [
                      Icon(
                        Icons.block,
                        size: 18,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Block', style: GoogleFonts.poppins(fontSize: 13)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 188, 237, 189),
        shadowColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _chatController.scrollController,
              itemCount: _chatController.mes.length,
              itemBuilder: (context, index) {
                index = _chatController.mes.length - index - 1;
                return MessageBubble(
                  text: _chatController.mes[index].message!,
                  isMe: _chatController.mes[index].type!,
                  imagelink: (_chatController.mes[index].type) != "destination"
                      ? userimage
                      : widget.userimage,
                );
              },
            ),
          ),
          Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 54,
                      // width: 300,
                      decoration: BoxDecoration(
                        color: Appcolor.greencolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextFormField(
                          focusNode: _textFormFieldFocus,

                          cursorColor: Appcolor.blueColor,
                          // focusNode: FocusScope.of(context).requestFocus(),
                          controller: _chatController.messageController.value,
                          onChanged: (value) {
                            // Handle text changes and update the list
                            // No need to call setState here
                          },
                          onTap: () {
                            emojiShowing.value = !(emojiShowing.value);
                          },
                          // onFieldSubmitted: _sendMessage,
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                              color: Appcolor.blackcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Say Something nice....",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(12, 11, 8, 10),
                            prefixIcon: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                emojiShowing.value = !(emojiShowing.value);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Icon(Icons.face_2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        _chatController.sendMessage(
                            _chatController.messageController.value.text,
                            widget.sourceId,
                            widget.targetId,
                            widget.roomindex);
                      },
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          color: Appcolor.blueColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          Obx(() {
            print("hello");
            return Offstage(
              offstage: !(emojiShowing.value),
              child: Container(
                height: 250,
                child: EmojiPicker(
                  textEditingController:
                      _chatController.messageController.value,
                  config: Config(
                    columns: 7,
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    recentTabBehavior: RecentTabBehavior.RECENT,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: const SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding:
      //       const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
      //   child: TextField(
      //     controller: _controller,
      //     onChanged: (value) {
      //       // You don't need to add the message here
      //     },
      //     decoration: InputDecoration(
      //         fillColor: const Color.fromARGB(255, 239, 208, 218),
      //         filled: true,
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         hintStyle: TextStyle(
      //           color: Colors.black,
      //         ),
      //         hintText: "Type your message..........",
      //         suffixIcon: IconButton(
      //           onPressed: () {
      //             myController.addMessage(_controller.text);
      //             _controller.clear();
      //           },
      //           icon: Icon(Icons.send),
      //         )),
      //   ),
      // ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String isMe;
  final String imagelink;

  const MessageBubble(
      {super.key,
      required this.text,
      required this.isMe,
      required this.imagelink});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(14),
      topRight: const Radius.circular(14),
      bottomLeft: Radius.circular(isMe != "destination" ? 14 : 0),
      bottomRight: Radius.circular(isMe != "destination" ? 0 : 14),
    );

    Color messageColor =
        isMe != "destination" ? Appcolor.blueColor : const Color(0xFFEFD5FF);
    Color textColor =
        isMe != "destination" ? Colors.white : Appcolor.blackcolor;

    Gradient? messageGradient = isMe != "destination"
        ? null
        : LinearGradient(
            colors: [
              Appcolor.blueColor,
              Colors.white,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: Row(
        mainAxisAlignment: isMe != "destination"
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (isMe == "destination")
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imagelink),
                radius: 15,
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.5,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(),
              borderRadius: borderRadius,
              color: messageColor == Colors.pink
                  ? messageColor
                  : Appcolor.blueColor,
              // : AppColor.greyColor.withOpacity(0.10),
              // gradient: messageGradient,
            ),
            // decoration: ShapeDecoration(
            //   shape: BeveledRectangleBorder(
            //     borderRadius: borderRadius,
            //   ),
            //   color: messageGradient == null ? messageColor : null,
            //   gradient: messageGradient,
            // ),
            child: Wrap(
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  // Your state implementation here

