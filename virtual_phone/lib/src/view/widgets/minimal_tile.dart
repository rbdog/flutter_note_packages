import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'minimal_tile_props.dart';

/// タイル
class MinimalTile extends StatelessWidget {
  const MinimalTile._({
    required this.props,
  });

  final MinimalTileProps props;

  factory MinimalTile.tapAction({
    required Widget title,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    final props = TapActionProps(
      title: title,
      icon: icon,
      onTap: onTap,
    );
    return MinimalTile._(props: props);
  }

  factory MinimalTile.navigation({
    required Widget title,
    required WidgetBuilder builder,
  }) {
    final props = NavigationProps(
      title: title,
      builder: builder,
    );
    return MinimalTile._(props: props);
  }

  factory MinimalTile.onOff({
    required Widget title,
    required bool value,
    required void Function(bool newValue) onChanged,
  }) {
    final props = OnOffProps(
      title: title,
      value: value,
      onChanged: onChanged,
    );
    return MinimalTile._(props: props);
  }

  factory MinimalTile.withChild({
    required Widget title,
    required Widget child,
  }) {
    final props = WithChildProps(
      title: title,
      child: child,
    );
    return MinimalTile._(props: props);
  }

  @override
  Widget build(BuildContext context) {
    final tileProps = props;
    if (tileProps is TapActionProps) {
      return _TapActionTile(props: tileProps);
    }
    if (tileProps is NavigationProps) {
      return _NavigationTile(props: tileProps);
    }
    if (tileProps is OnOffProps) {
      return _OnOffTile(props: tileProps);
    }
    if (tileProps is WithChildProps) {
      return _WithChildTile(props: tileProps);
    }
    throw Exception('unknown props');
  }
}

class _TapActionTile extends StatelessWidget {
  const _TapActionTile({
    required this.props,
  });

  final TapActionProps props;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: props.onTap,
        child: Container(
          height: 40,
          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
          child: Row(
            children: [
              Expanded(child: props.title),
              props.icon,
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({
    required this.props,
  });

  final NavigationProps props;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: props.builder,
            ),
          );
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
          child: Row(
            children: [
              Expanded(child: props.title),
              const Icon(
                Icons.chevron_right,
                color: BrandColor.weakIcon,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OnOffTile extends StatelessWidget {
  const _OnOffTile({
    required this.props,
  });

  final OnOffProps props;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      child: Row(
        children: [
          Expanded(child: props.title),
          Switch(
            activeTrackColor: BrandColor.enabledSwitch,
            inactiveTrackColor: BrandColor.inactiveGrayout,
            inactiveThumbColor: BrandColor.content,
            trackOutlineWidth: WidgetStateProperty.all(0),
            trackOutlineColor: WidgetStateProperty.all(
              BrandColor.inactiveGrayout,
            ),
            value: props.value,
            onChanged: props.onChanged,
          ),
        ],
      ),
    );
  }
}

class _WithChildTile extends StatelessWidget {
  const _WithChildTile({
    required this.props,
  });

  final WithChildProps props;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
          child: props.title,
        ),
        // Child
        Container(
          alignment: Alignment.center,
          child: props.child,
        ),
      ],
    );
  }
}
