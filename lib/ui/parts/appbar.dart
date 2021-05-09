import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:matching_app_framework/ui/login.dart';
import 'package:matching_app_framework/ui/profile.dart';

AppBar getAppBar(BuildContext context, text) {
  return AppBar(
    centerTitle: true,
    // title: Text('' + text, style: TextStyle(fontSize: 32.0)),
    title: Text('' + text, style: TextStyle(fontSize: 32.0)),
    // leading: _buildProfileIconButton(),
    leading: IconButton(
      icon: SvgPicture.string(
        '<svg viewBox="16.5 16.3 9.0 9.0" > <path transform="translate(-3.01, -3.21)" d="M 24 28.60000038146973 C 22.01905250549316 28.59039878845215 20.27518463134766 27.29202079772949 19.6980094909668 25.39699554443359 C 19.12083435058594 23.50197219848633 19.84486389160156 21.45193862915039 21.48413467407227 20.33971405029297 C 23.12340354919434 19.22749137878418 25.29588317871094 19.31228256225586 26.84347915649414 20.54888916015625 C 28.39107513427734 21.78549575805664 28.9531192779541 23.8857250213623 28.22999954223633 25.72999954223633 C 27.56734466552734 27.48378372192383 25.87452125549316 28.63234329223633 24.00000190734863 28.60000228881836 Z" fill="none" stroke="#231815" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /> <path transform="translate(0.0, 0.0)" d="M 29.44563293457031 19.02455139160156 L 30.47549247741699 18.17914199829102 C 30.97789192199707 17.84090614318848 31.14653778076172 17.1795482635498 30.86745643615723 16.64203643798828 L 29.57628440856934 14.40555000305176 C 29.29612350463867 13.8998851776123 28.68301010131836 13.68232822418213 28.14678001403809 13.89830493927002 L 26.6788444519043 14.45934772491455 C 26.33401679992676 14.59306716918945 25.9453125 14.54699897766113 25.64129638671875 14.33637809753418 C 25.21808242797852 14.03856182098389 24.76777458190918 13.78124332427979 24.29633140563965 13.56782722473145 C 23.95427513122559 13.41793823242188 23.71532249450684 13.10030651092529 23.66611862182617 12.73010444641113 L 23.40480995178223 11.19299983978271 C 23.3174991607666 10.64179134368896 22.84079360961914 10.23691749572754 22.28272247314453 10.23999404907227 L 19.70038604736328 10.23999404907227 C 19.14231300354004 10.23691844940186 18.66560935974121 10.64179134368896 18.57829856872559 11.19299983978271 L 18.31698989868164 12.73010444641113 C 18.26635360717773 13.09971809387207 18.02787399291992 13.41672420501709 17.68677711486816 13.56782627105713 C 17.21373558044434 13.78288078308105 16.76102066040039 14.04010391235352 16.33412551879883 14.33638000488281 C 16.03349494934082 14.54829692840576 15.64634132385254 14.59452438354492 15.30426406860352 14.45934772491455 L 13.83632850646973 13.89830493927002 C 13.31285667419434 13.70322418212891 12.72501754760742 13.91432666778564 12.44524765014648 14.39786338806152 L 11.15407943725586 16.62666511535645 C 10.87434959411621 17.11112213134766 10.98841285705566 17.72706604003906 11.42307281494141 18.07922744750977 L 12.59895896911621 19.03992080688477 C 12.8953685760498 19.28569602966309 13.04841613769531 19.66398620605469 13.00629234313965 20.04672622680664 C 12.96527099609375 20.55827522277832 12.96527099609375 21.07228660583496 13.00629234313965 21.58383750915527 C 13.03854370117188 21.96231651306152 12.88352966308594 22.3326244354248 12.59127235412598 22.57526397705078 L 11.42307281494141 23.52826881408691 C 10.99396133422852 23.88427543640137 10.88362884521484 24.49759674072266 11.16176605224609 24.98083305358887 L 12.45293426513672 27.21732330322266 C 12.73270416259766 27.70085906982422 13.32054138183594 27.91195869445801 13.84401321411133 27.71688270568848 L 15.1966667175293 27.20195388793945 C 15.54388618469238 27.0668773651123 15.93550872802734 27.11295127868652 16.24189949035645 27.32492256164551 C 16.70186805725098 27.66334915161133 17.19652366638184 27.95189666748047 17.71751976013184 28.18570137023926 C 18.05928039550781 28.34568977355957 18.29859924316406 28.66574478149414 18.35541725158691 29.03879737854004 L 18.58598327636719 30.45293235778809 C 18.67329216003418 31.0041389465332 19.14999771118164 31.40901374816895 19.70806884765625 31.40593910217285 L 22.29040718078613 31.40593910217285 C 22.84847640991211 31.40900993347168 23.32518005371094 31.0041389465332 23.41248893737793 30.45293235778809 L 23.64305877685547 29.03879547119141 C 23.70135307312012 28.66449165344238 23.93981552124023 28.34271049499512 24.28096008300781 28.17802047729492 C 24.80237579345703 27.9481315612793 25.29717254638672 27.66207695007324 25.75657653808594 27.32492256164551 C 26.06143379211426 27.10893249511719 26.45514488220215 27.06261253356934 26.80180931091309 27.20195388793945 L 28.15446090698242 27.71688270568848 C 28.67793273925781 27.91196250915527 29.26577186584473 27.70086097717285 29.54554176330566 27.21732330322266 L 30.83670997619629 24.9808349609375 C 31.11644554138184 24.49637794494629 31.00238037109375 23.88043403625488 30.56771850585938 23.52827072143555 L 29.44563293457031 22.60600662231445 C 29.12875747680664 22.36648750305176 28.95978355407715 21.97901725769043 28.99986839294434 21.58383178710938 C 29.05697250366211 21.07305335998535 29.05697631835938 20.55750274658203 28.99987030029297 20.04672622680664 C 28.95978736877441 19.65154266357422 29.12875747680664 19.26407051086426 29.44563293457031 19.02455139160156 Z" fill="none" stroke="#231815" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>',
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.fill,
      ),
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage(title: AppLocalizations.of(context).hello("kazutxt")),
            )
        );
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.account_circle_outlined),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(title: AppLocalizations.of(context).hello("kazutxt")),
              )
          );
        },
      ),
      IconButton(
        icon: Icon(
          Icons.menu,
        ),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(title: 'Matching App Framework - Login')
              )
          );
        },
      ),
    ],
  );
}
Widget _buildProfileIconButton() {
  const iconSize = 32.0;
  const photoUrl = 'https://i.pinimg.com/564x/9a/58/90/9a5890d0ea7e56067ed44fbae3ff4552.jpg';
  return IconButton(
      icon: photoUrl == null
          ? Icon(
        Icons.account_circle,
        size: iconSize,
      )
          : CircleAvatar(
        //backgroundImage: NetworkImage(photoUrl),
        backgroundImage: Image.asset('assets/mio_imada.jpg').image,
        // backgroundImage: Image(image: AssetImage('assets/logo.png')).image,
        backgroundColor: Colors.transparent,
        radius: iconSize / 2,
      ),
      onPressed: () { return 0; } ,
    );
}