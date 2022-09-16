part of 'all_animals_page_view.dart';

class _CompleteWidget extends StatefulWidget {
  const _CompleteWidget({required this.animals, this.scrollController});

  final List<MAnimal> animals;
  final ScrollController? scrollController;

  @override
  State<_CompleteWidget> createState() => __CompleteWidgetState();
}

class __CompleteWidgetState extends State<_CompleteWidget> {
  void _onItemTap(MAnimal animal) {
    CustomBottomSheet.showCustomModalBottomSheet(
      context,
      children: _AllAnimalsDetails().details(context, animal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: widget.scrollController,
      interactive: true,
      thumbVisibility: true,
      thickness: 8,
      radius: context.normalRadius,
      child: Padding(
        padding: context.onlyRightPaddingNormal,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: widget.animals.length,
          itemBuilder: (context, index) {
            MAnimal animal = widget.animals[index];

            print(animal.name);
            return _item(context, index);
          },
        ),
      ),
    );
  }

  Widget _item(BuildContext context, int index) {
    MAnimal animal = widget.animals[index];
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          children: [
            Expanded(
              child: Text(animal.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: context.textTheme.titleLarge),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
