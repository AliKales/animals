part of 'all_animals_page_view.dart';

class _AllAnimalsDetails {
  List<Widget> details(BuildContext context, MAnimal animal) {
    return [
      Text("Name: ${animal.name!}"),
      Text("Scientific Name: ${animal.scientificname!}"),
      Text("Kingdom: ${animal.kingdom!}"),
      Text("Family: ${animal.family!}"),
      Text("Class Name: ${animal.classname!}"),
      Text("Genus: ${animal.genus!}"),
      Text("Order: ${animal.order!}"),
      Text("Phylum: ${animal.phylum!}"),
      context.emptySizedHeightBoxNormal,
      if (animal.name != "-")
        TextButton(
          onPressed: () {
            UUrlLauncher().launchGoogleImages(animal.name!);
          },
          child: Text("See Image"),
        )
    ];
  }
}
