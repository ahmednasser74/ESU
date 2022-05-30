import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PopularQuestionItemWidget extends StatefulWidget {
  const PopularQuestionItemWidget({
    Key? key,
    required this.index,
    required this.isExpanded,
  }) : super(key: key);

  final int index;
  final bool isExpanded;

  @override
  State<PopularQuestionItemWidget> createState() =>
      _PopularQuestionItemWidgetState();
}

class _PopularQuestionItemWidgetState extends State<PopularQuestionItemWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
              bottomLeft:
                  widget.isExpanded ? Radius.zero : const Radius.circular(8),
              bottomRight:
                  widget.isExpanded ? Radius.zero : const Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'widget.popularQuestion.question!',
                  style: TextStyle(
                    color: widget.isExpanded
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                widget.isExpanded
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_left_rounded,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.isExpanded,
          child: AnswerPopularQuestionWidget(
            isExpanded: widget.isExpanded,
            answer: 'widget.popularQuestion.answer!',
          ),
        ),
      ],
    );
  }
}

class AnswerPopularQuestionWidget extends StatefulWidget {
  AnswerPopularQuestionWidget({
    Key? key,
    this.isExpanded = false,
    required this.answer,
  }) : super(key: key);
  bool isExpanded;
  final String answer;

  @override
  State<AnswerPopularQuestionWidget> createState() =>
      _AnswerPopularQuestionWidgetState();
}

class _AnswerPopularQuestionWidgetState
    extends State<AnswerPopularQuestionWidget> with TickerProviderStateMixin {
  late AnimationController _controllerOfTitle;
  late Animation<Offset> _offsetAnimationOfTitle;

  @override
  void initState() {
    _controllerOfTitle = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();

    _offsetAnimationOfTitle = Tween<Offset>(
      begin: const Offset(0, -.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controllerOfTitle,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => widget.isExpanded = !widget.isExpanded),
      child: SlideTransition(
        position: _offsetAnimationOfTitle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            color: const Color(0xffaeddf3),
          ),
          child: Html(
            data: widget.answer,
            onLinkTap: (url, _, attributes, element) async {
              if (url != null) {
                await HelperMethod.launchToBrowser(url);
              }
            },
          ),
        ),
      ),
    );
  }
}
