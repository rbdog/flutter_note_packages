import 'package:flutter/material.dart';

import '../../logic/device_model/types/preset_model.dart';
import '../widgets/classic_model_section_header.dart';
import '../widgets/fantasy_model_section_header.dart';
import '../widgets/minimal_page.dart';
import '../widgets/section.dart';
import '../widgets/minimal_section_list.dart';
import '../widgets/pick_model_tile.dart';

class PickModelPage extends StatelessWidget {
  const PickModelPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MinimalPage(
      title: '機種',
      body: MinimalSectionList(
        sections: [
          StaticSection(
            header: const ClassicModelSectionHeader(),
            tiles: [
              PickModelTile(
                modelId: PresetModel.classicIphone.id,
              ),
              PickModelTile(
                modelId: PresetModel.classicAndroid.id,
              ),
            ],
          ),
          StaticSection(
            header: const FantasyModelSectionHeader(),
            tiles: [
              PickModelTile(
                modelId: PresetModel.rotom.id,
              ),
            ],
          ),
          // Section(
          //   header: 'Standard',
          //   tiles: [
          //     PickModelTile(
          //       modelId: PresetDevice.iphone14.id,
          //     ),
          //     PickModelTile(
          //       modelId: PresetDevice.galaxyS22.id,
          //     ),
          //     PickModelTile(
          //       modelId: PresetDevice.iphoneSE3.id,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
