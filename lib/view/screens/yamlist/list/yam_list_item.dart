import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';

class YamListItem extends StatelessWidget {
  const YamListItem({Key? key}) : super(key: key);

  Widget _getChip(String text) => SizedBox(
        height: 32,
        child: Chip(
          visualDensity: VisualDensity.compact,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          label: Text(text),
          labelStyle: NotoSans.size(
            14,
            color: ColorResource.grey_0xff696969,
          ),
          backgroundColor: ColorResource.grey_0xffeeeeee,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: Image.network(
            'https://mblogthumb-phinf.pstatic.net/MjAyMDAyMDJfMTM2/MDAxNTgwNjU0NjA4NjYx.MKNQa4qm420twqahO6A4aceYsTEJhMCttaEcXOKEbtkg.PQbPC6LKckZObB0tauSN3Wt6IAT9euMdX7wofSD9Fugg.JPEG.cozy95/3.JPG?type=w800',
          ).image,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('만포면옥본점', style: NotoSans.size(18)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '한식당  | ',
                    style:
                        NotoSans.size(14, color: ColorResource.grey_0xff959595),
                  ),
                  Text(
                    '1.5km',
                    style:
                        NotoSans.size(14, color: ColorResource.grey_0xff696969),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 4,
                children: List.generate(
                  5,
                  (index) {
                    switch (index) {
                      case 0:
                        return _getChip('#멸치국수맛집들');
                      case 1:
                        return _getChip('#포장가능맛집들');
                      case 2:
                        return _getChip('#동네맛집');
                      case 3:
                        return _getChip('#가볍게먹을맛집');
                      case 4:
                        return _getChip('#은평구맛집');
                      default:
                        return _getChip('');
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
