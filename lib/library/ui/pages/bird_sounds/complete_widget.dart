part of 'bird_sounds_view.dart';

class _CompleteWidget extends StatefulWidget {
  const _CompleteWidget({required this.birdSounds});

  final List<MBirdSound> birdSounds;

  @override
  State<_CompleteWidget> createState() => __CompleteWidgetState();
}

class __CompleteWidgetState extends State<_CompleteWidget> {
  late List<MBirdSound> birdSounds;
  UJustAudio justAudio = UJustAudio();

  final ValueNotifier<int> _playingIndex = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    birdSounds = widget.birdSounds;

    justAudio.getPlayingStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        _playingIndex.value = -1;
        justAudio.resetLink();
      }
    });
  }

  void _handleItemClick(MBirdSound birdSound, int index, bool isPlaying) async {
    if (isPlaying) {
      _playingIndex.value = -1;
      await justAudio.pause();
    } else {
      _playingIndex.value = index;
      if (justAudio.getCurrentLink != birdSound.soundLink) {
        await justAudio.setUrl(birdSound.soundLink!);
      }
      await justAudio.play();
    }
  }

  void _onMoreClicked(MBirdSound birdSound) {
    CustomBottomSheet.showCustomModalBottomSheet(
      context,
      children: BirdSoundDetails().birdSoundDetailsView(context, birdSound),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _item(birdSounds[index], index),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: birdSounds.length);
  }

  Widget _item(MBirdSound birdSound, int index) {
    return Row(
      children: [
        Expanded(child: _card(index, birdSound)),
        IconButton(
          onPressed: () => _onMoreClicked(birdSound),
          icon: const Icon(Icons.more_horiz_sharp),
        ),
      ],
    );
  }

  ValueListenableBuilder<int> _card(int index, MBirdSound birdSound) {
    return ValueListenableBuilder(
        valueListenable: _playingIndex,
        builder: (context, _, __) {
          bool isPlaying = _playingIndex.value == index;
          return InkWell(
            onTap: () => _handleItemClick(birdSound, index, isPlaying),
            child: Card(
              child: Padding(
                padding: context.paddingNormal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textCount(index),
                    _textNames(birdSound),
                    _iconPlayPause(isPlaying),
                  ],
                ),
              ),
            ),
          );
        });
  }

  AnimatedCrossFade _iconPlayPause(bool isPlaying) {
    return AnimatedCrossFade(
      firstChild: const Icon(Icons.play_arrow),
      secondChild: const Icon(Icons.pause),
      duration: const Duration(milliseconds: 200),
      crossFadeState:
          isPlaying ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  Expanded _textNames(MBirdSound birdSound) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: context.textTheme.bodyLarge,
          children: [
            TextSpan(
                text: "${birdSound.gen}\n",
                style: context.textTheme.titleLarge),
            TextSpan(text: "${birdSound.sp}\n"),
            TextSpan(text: birdSound.ssp),
          ],
        ),
      ),
    );
  }

  Text _textCount(int index) =>
      Text("${index + 1}- ", style: context.textTheme.titleLarge);
}
