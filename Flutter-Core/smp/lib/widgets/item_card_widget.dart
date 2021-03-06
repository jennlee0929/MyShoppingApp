import 'package:flutter/material.dart';
import 'package:ldp/model/user_view_model.dart';
import 'package:myapp_core/models/item_view_model.dart';
import 'package:myapp_core/widgets/image_section_widget.dart';
import 'package:smp/utils/constants.dart';
import 'package:ldp/ldp_screen.dart';

const double kDefaultPaddin = 2;

class ItemCardWidget extends StatefulWidget {
  final String listingID;
  final bool isFromSeller;
  final UserViewModel userViewModel;

  const ItemCardWidget(
      {Key key,
      @required this.listingID,
      @required this.isFromSeller,
      this.userViewModel})
      : super(key: key);
  @override
  _ItemCardWidgetState createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  ItemViewModel itemViewModel;

  @override
  Widget build(BuildContext context) {
    _setItemViewModel(widget.listingID ?? null);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Theme.of(context).cardColor)],
        borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LdpScreen(
                    listingID: itemViewModel?.listingID ?? null,
                    isFromUser: !widget.isFromSeller,
                    userViewModel: widget?.userViewModel ?? null))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSectionWidget(
              imageHeight: IMAGE_HEIGHT_IMAGECARD,
              imageURL: itemViewModel?.imageURL,
              cardBorderTopRadius: CARD_BORDER_RADIUS,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(itemViewModel?.title ?? "",
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(itemViewModel?.price ?? "",
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setItemViewModel(String listingID) async {
    ItemViewModel tempIVM = await ItemViewModel.of(widget?.listingID ?? null);
    setState(() {
      itemViewModel = tempIVM;
    });
  }
}
