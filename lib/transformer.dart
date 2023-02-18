    import 'package:flutter/widgets.dart';

    class TransformInfo {
      final double height;
      final double position;
      final int index;

      TransformInfo({
        required this.index,
        required this.position,
        required this.height,
      });
    }

    abstract class PageTransformer {
      Widget transform(Widget child, TransformInfo info);
    }

    class TransformerPageController extends PageController {
      final int itemCount;

      TransformerPageController({
        int initialPage = 0,
        required this.itemCount,
      }) : super(
              initialPage: itemCount - initialPage - 1,
            );

      int getRenderIndexFromRealIndex(num index) {
        return itemCount - index - 1 as int;
      }

      double get realPage {
        return page as double;
      }
    }

    class TransformerPageView extends StatefulWidget {
      final PageTransformer transformer;
      final ValueChanged<int>? onPageChanged;
      final IndexedWidgetBuilder itemBuilder;
      final TransformerPageController? pageController;
      final int itemCount;
      final int? index;
      const TransformerPageView({
        Key? key,
        this.index,
        this.onPageChanged,
        required this.transformer,
        required this.itemBuilder,
        this.pageController,
        required this.itemCount,
      }) : super(key: key);

      @override
      State<StatefulWidget> createState() {
        return _TransformerPageViewState();
      }
    }

    class _TransformerPageViewState extends State<TransformerPageView> {
      Size? size;

      Widget _buildItem(BuildContext context, int index) {
        return AnimatedBuilder(
            animation: widget.pageController!,
            
            builder: (c, w) {
              int renderIndex =
                  widget.pageController!.getRenderIndexFromRealIndex(index);
              Widget? child;
              child = widget.itemBuilder(context, renderIndex);
              if (size == null) {
                return child;
              }
              double position;

              double page = widget.pageController!.realPage;
              position = page - index;
              position *= 1;
              TransformInfo info = TransformInfo(
                index: renderIndex,
                height: size!.height,
                position: position.clamp(-1.0, 1.0),
              );
              return widget.transformer.transform(child, info);
            });
      }

      @override
      Widget build(BuildContext context) {
        return PageView.builder(
          itemBuilder: _buildItem,
          physics: const CustomPageViewScrollPhysics(),
          itemCount: widget.itemCount,
          onPageChanged: _onIndexChanged,
          controller: widget.pageController,
          scrollDirection: Axis.vertical,
          pageSnapping: true,
          reverse: true,
        );
      }

      void _onIndexChanged(int index) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(
              widget.pageController!.getRenderIndexFromRealIndex(index));
        }
      }

      void _onGetSize(_) {
        RenderObject? renderObject = context.findRenderObject();
        if (renderObject != null) {
          Rect bounds = renderObject.paintBounds;
          setState(() {
            size = bounds.size;
          });
        }
      }

      @override
      void didChangeDependencies() {
        WidgetsBinding.instance.addPostFrameCallback(_onGetSize);
        super.didChangeDependencies();
      }
    }

    class CustomPageViewScrollPhysics extends ScrollPhysics {
      const CustomPageViewScrollPhysics({ScrollPhysics? parent})
          : super(parent: parent);

      @override
      CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
        return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
      }

      @override
      SpringDescription get spring => const SpringDescription(
            mass: 50,
            stiffness: 100,
            damping: 0.8,
          );
    }
