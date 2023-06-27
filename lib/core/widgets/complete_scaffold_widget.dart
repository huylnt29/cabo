import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CompleteScaffoldWidget extends StatefulWidget {
  const CompleteScaffoldWidget({
    this.backButtonEnabled = true,
    required this.appBarTitle,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    Key? key,
    this.onTapScreen,
  }) : super(key: key);
  final bool? backButtonEnabled;
  final String appBarTitle;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final VoidCallback? onTapScreen;

  @override
  State<CompleteScaffoldWidget> createState() => _CompleteScaffoldWidgetState();
}

class _CompleteScaffoldWidgetState extends State<CompleteScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        widget.onTapScreen?.call();
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: (widget.backButtonEnabled!)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Container(),
          title: Text(widget.appBarTitle),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.black,
        ),
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
