import 'dart:math';

enum Flavor {
  fatiha,
  baqareh,
  emran,
  nesa,
  maede,
  anam,
  eraf,
  anfal,
  tobeh,
  yones,
  hod,
  usef,
  raad,
  ebrahim,
  hajar,
  nahl,
  esra,
  kahf,
  maryam,
  taha,
  anbya,
  haj,
  momenon,
  nor,
  forghan,
  shoara,
  naml,
  ghesas,
  ankaboot,
  rom,
  loghman,
  sajdeh,
  ahzab,
  saba,
  fater,
  yasin,
  safat,
  sad,
  zmr,
  ghaf,
  fslat,
  shora,
  zkhrf,
  dokhan,
  jasieh,
  ahghaf,
  mhmd,
  fath,
  hojrat,
  qafr,
  zariyat,
  tor,
  najm,
  ghamar,
  alrahman,
  vaqee,
  hadid,
  mojadl,
  hashr,
  momtahn,
  saf,
  jome,
  mnfghn,
  tghbn,
  talagh,
  tahrim,
  molk,
  qlm,
  haqe,
  mraj,
  noh,
  jen,
  mozamel,
  mdser,
  ghiyamt,
  nsan,
  mrslt,
  naba,
  nazat,
  abas,
  takwir,
  nftar,
  mtffin,
  nshqaq,
  broj,
  taregh,
  ala,
  qashie,
  fajr,
  balad,
  shams,
  layl,
  zoha,
  sharh,
  tin,
  alaq,
  qadr,
  bayyina,
  zalzalah,
  adiyat,
  qariah,
  takathur,
  asr,
  humazah,
  fil,
  quraysh,
  maun,
  kawthar,
  kafirun,
  nasr,
  masad,
  ikhlas,
  falaq,
  nas,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.fatiha:
        return 'سورة الفاتحة';
      case Flavor.baqareh:
        return 'سورة البقرة';
      case Flavor.emran:
        return 'سورة آل عمران';
      case Flavor.nesa:
        return 'سورة النساء';
      case Flavor.maede:
        return 'سورة المائدة';
      case Flavor.anam:
        return 'سورة الأنعام';
      case Flavor.eraf:
        return 'سورة الأعراف';
      case Flavor.anfal:
        return 'سورة الأنفال';
      case Flavor.tobeh:
        return 'سورة التوبة';
      case Flavor.yones:
        return 'سورة يونس';
      case Flavor.hod:
        return 'سورة هود';
      case Flavor.usef:
        return 'سورة يوسف';
      case Flavor.raad:
        return 'سورة الرعد';
      case Flavor.ebrahim:
        return 'سورة إبراهيم';
      case Flavor.hajar:
        return 'سورة الحجر';
      case Flavor.nahl:
        return 'سورة النحل';
      case Flavor.esra:
        return 'سورة الإسراء';
      case Flavor.kahf:
        return 'سورة الكهف';
      case Flavor.maryam:
        return 'سورة مريم';
      case Flavor.taha:
        return 'سورة طه';
      case Flavor.anbya:
        return 'سورة الأنبياء';
      case Flavor.haj:
        return 'سورة الحج';
      case Flavor.momenon:
        return 'سورة المؤمنون';
      case Flavor.nor:
        return 'سورة النور';
      case Flavor.forghan:
        return 'سورة الفرقان';
      case Flavor.shoara:
        return 'سورة الشعراء';
      case Flavor.naml:
        return 'سورة النمل';
      case Flavor.ghesas:
        return 'سورة القصص';
      case Flavor.ankaboot:
        return 'سورة العنكبوت';
      case Flavor.rom:
        return 'سورة الروم';
      case Flavor.loghman:
        return 'سورة لقمان';
      case Flavor.sajdeh:
        return 'سورة السجدة';
      case Flavor.ahzab:
        return 'سورة الأحزاب';
      case Flavor.saba:
        return 'سورة سبأ';
      case Flavor.fater:
        return 'سورة فاطر';
      case Flavor.yasin:
        return 'سورة يس';
      case Flavor.safat:
        return 'سورة الصافات';
      case Flavor.sad:
        return 'سورة ص';
      case Flavor.zmr:
        return 'سورة الزمر';
      case Flavor.ghaf:
        return 'سورة ق';
      case Flavor.fslat:
        return 'سورة فصلت';
      case Flavor.shora:
        return 'سورة الشورى';
      case Flavor.zkhrf:
        return 'سورة الزخرف';
      case Flavor.dokhan:
        return 'سورة الدخان';
      case Flavor.jasieh:
        return 'سورة الجاثية';
      case Flavor.ahghaf:
        return 'سورة الأحقاف';
      case Flavor.mhmd:
        return 'سورة محمد';
      case Flavor.fath:
        return 'سورة الفتح';
      case Flavor.hojrat:
        return 'سورة الحجرات';
      case Flavor.qafr:
        return 'سورة غافر';
      case Flavor.zariyat:
        return 'سورة الذاريات';
      case Flavor.tor:
        return 'سورة الطور';
      case Flavor.najm:
        return 'سورة النجم';
      case Flavor.ghamar:
        return 'سورة القمر';
      case Flavor.alrahman:
        return 'سورة الرحمن';
      case Flavor.vaqee:
        return 'سورة الواقعة';
      case Flavor.hadid:
        return 'سورة الحديد';
      case Flavor.mojadl:
        return 'سورة المجادلة';
      case Flavor.hashr:
        return 'سورة الحشر';
      case Flavor.momtahn:
        return 'سورة الممتحنة';
      case Flavor.saf:
        return 'سورة الصف';
      case Flavor.jome:
        return 'سورة الجمعة';
      case Flavor.mnfghn:
        return 'سورة المنافقون';
      case Flavor.tghbn:
        return 'سورة التغابن';
      case Flavor.talagh:
        return 'سورة الطلاق';
      case Flavor.tahrim:
        return 'سورة التحريم';
      case Flavor.molk:
        return 'سورة الملك';
      case Flavor.qlm:
        return 'سورة القلم';
      case Flavor.haqe:
        return 'سورة الحاقة';
      case Flavor.mraj:
        return 'سورة المعارج';
      case Flavor.noh:
        return 'سورة نوح';
      case Flavor.jen:
        return 'سورة الجن';
      case Flavor.mozamel:
        return 'سورة المزمل';
      case Flavor.mdser:
        return 'سورة المدثر';
      case Flavor.ghiyamt:
        return 'سورة القيامة';
      case Flavor.nsan:
        return 'سورة الإنسان';
      case Flavor.mrslt:
        return 'سورة المرسلات';
      case Flavor.naba:
        return 'سورة النبأ';
      case Flavor.nazat:
        return 'سورة النازعات';
      case Flavor.abas:
        return 'سورة عبس';
      case Flavor.takwir:
        return 'سورة التكوير';
      case Flavor.nftar:
        return 'سورة الانفطار';
      case Flavor.mtffin:
        return 'سورة المطففين';
      case Flavor.nshqaq:
        return 'سورة الانشقاق';
      case Flavor.broj:
        return 'سورة البروج';
      case Flavor.taregh:
        return 'سورة الطارق';
      case Flavor.ala:
        return 'سورة الأعلى';
      case Flavor.qashie:
        return 'سورة الغاشية';
      case Flavor.fajr:
        return 'سورة الفجر';
      case Flavor.balad:
        return 'سورة البلد';
      case Flavor.shams:
        return 'سورة الشمس';
      case Flavor.layl:
        return 'سورة الليل';
      case Flavor.zoha:
        return 'سورة الضحى';
      case Flavor.sharh:
        return 'سورة الشرح';
      case Flavor.tin:
        return 'سورة التين';
      case Flavor.alaq:
        return 'سورة العلق';
      case Flavor.qadr:
        return 'سورة القدر';
      case Flavor.bayyina:
        return 'سورة البينة';
      case Flavor.zalzalah:
        return 'سورة الزلزلة';
      case Flavor.adiyat:
        return 'سورة العاديات';
      case Flavor.qariah:
        return 'سورة القارعة';
      case Flavor.takathur:
        return 'سورة التكاثر';
      case Flavor.asr:
        return 'سورة العصر';
      case Flavor.humazah:
        return 'سورة الهمزة';
      case Flavor.fil:
        return 'سورة الفيل';
      case Flavor.quraysh:
        return 'سورة قريش';
      case Flavor.maun:
        return 'سورة الماعون';
      case Flavor.kawthar:
        return 'سورة الكوثر';
      case Flavor.kafirun:
        return 'سورة الكافرون';
      case Flavor.nasr:
        return 'سورة النصر';
      case Flavor.masad:
        return 'سورة المسد';
      case Flavor.ikhlas:
        return 'سورة الإخلاص';
      case Flavor.falaq:
        return 'سورة الفلق';
      case Flavor.nas:
        return 'سورة الناس';
    }
  }

  static String get appOpenAdToken {
    return switch (appFlavor) {
      Flavor.fatiha => 'ca-app-pub-7477781478326336/7454136222',
      Flavor.baqareh => 'ca-app-pub-7477781478326336/9349684558',

      Flavor.emran => 'ca-app-pub-7477781478326336/4879926628',

      Flavor.nesa => 'ca-app-pub-7477781478326336/6263774991',

      Flavor.maede => 'ca-app-pub-7477781478326336/5174749133',

      Flavor.anam => 'ca-app-pub-7477781478326336/8238130474',

      Flavor.eraf => 'ca-app-pub-7477781478326336/5101902414',

      Flavor.anfal => 'ca-app-pub-7477781478326336/9983528159',

      Flavor.tobeh => 'ca-app-pub-7477781478326336/5733805304',

      Flavor.yones => 'ca-app-pub-7477781478326336/9413377041',

      Flavor.hod => 'ca-app-pub-7477781478326336/8878382667',

      Flavor.usef => 'ca-app-pub-7477781478326336/4324017765',

      Flavor.raad => 'ca-app-pub-7477781478326336/9205579208',

      Flavor.ebrahim => 'ca-app-pub-7477781478326336/1340242060',

      Flavor.hajar => 'ca-app-pub-7477781478326336/1486037135',

      Flavor.nahl => 'ca-app-pub-7477781478326336/8395114312',

      Flavor.esra => 'ca-app-pub-7477781478326336/7501529573',

      Flavor.kahf => 'ca-app-pub-7477781478326336/4929440853',

      Flavor.maryam => 'ca-app-pub-7477781478326336/6829680034',

      Flavor.taha => 'ca-app-pub-7477781478326336/1644801969',

      Flavor.anbya => 'ca-app-pub-7477781478326336/3418119801',

      Flavor.haj => 'ca-app-pub-7477781478326336/8826305252',

      Flavor.momenon => 'ca-app-pub-7477781478326336/6351457521',

      Flavor.nor => 'ca-app-pub-7477781478326336/6143531745',

      Flavor.forghan => 'ca-app-pub-7477781478326336/8879960356',

      Flavor.shoara => "",

      Flavor.naml => 'ca-app-pub-7477781478326336/6754729587',

      Flavor.ghesas => 'ca-app-pub-7477781478326336/4569769587',

      Flavor.ankaboot => 'ca-app-pub-7477781478326336/6169753725',

      Flavor.rom => 'ca-app-pub-7477781478326336/9985747799',

      Flavor.loghman => 'ca-app-pub-7477781478326336/4970893139',

      Flavor.sajdeh => 'ca-app-pub-7477781478326336/1745091857',

      Flavor.ahzab => 'ca-app-pub-7477781478326336/7427611687',

      Flavor.saba => 'ca-app-pub-7477781478326336/8842689536',

      Flavor.fater => 'ca-app-pub-7477781478326336/4597458231',

      Flavor.yasin => [
        'ca-app-pub-7477781478326336/9837338322',
        'ca-app-pub-7477781478326336/8524256659',
      ].elementAt(Random().nextInt(2)),

      Flavor.safat => 'ca-app-pub-7477781478326336/2709661490',

      Flavor.sad => 'ca-app-pub-7477781478326336/6042347949',

      Flavor.zmr => 'ca-app-pub-7477781478326336/4613199288',

      Flavor.qafr => 'ca-app-pub-7477781478326336/3811253509',

      Flavor.fslat => 'ca-app-pub-7477781478326336/8484199525',

      Flavor.shora => 'ca-app-pub-7477781478326336/1692356624',

      Flavor.zkhrf => 'ca-app-pub-7477781478326336/2633941197',

      Flavor.dokhan => 'ca-app-pub-7477781478326336/4872766385',

      Flavor.jasieh => 'ca-app-pub-7477781478326336/4904805331',

      Flavor.ahghaf => 'ca-app-pub-7477781478326336/4717937228',

      Flavor.mhmd => 'ca-app-pub-7477781478326336/3501946521',

      Flavor.fath => 'ca-app-pub-7477781478326336/7416003393',

      Flavor.hojrat => 'ca-app-pub-7477781478326336/8689556614',

      Flavor.ghaf => 'ca-app-pub-7477781478326336/4578336427',

      Flavor.zariyat => 'ca-app-pub-7477781478326336/1341797053',

      Flavor.tor => 'ca-app-pub-7477781478326336/9895130333',

      Flavor.najm => 'ca-app-pub-7477781478326336/9172187559',

      Flavor.ghamar => 'ca-app-pub-7477781478326336/7221699684',

      Flavor.alrahman => 'ca-app-pub-7477781478326336/5180173551',

      Flavor.vaqee => 'ca-app-pub-7477781478326336/6193038176',

      Flavor.hadid => 'ca-app-pub-7477781478326336/4011945001',

      Flavor.mojadl => 'ca-app-pub-7477781478326336/8813094900',

      Flavor.hashr => 'ca-app-pub-7477781478326336/7503880722',

      Flavor.momtahn => 'ca-app-pub-7477781478326336/4490706517',

      Flavor.saf => 'ca-app-pub-7477781478326336/8255579753',

      Flavor.jome => 'ca-app-pub-7477781478326336/2495096626',

      Flavor.mnfghn => 'ca-app-pub-7477781478326336/5789106626',

      Flavor.tghbn => 'ca-app-pub-7477781478326336/9544464902',

      Flavor.talagh => 'ca-app-pub-7477781478326336/6786455532',

      Flavor.tahrim => 'ca-app-pub-7477781478326336/2723071531',

      Flavor.molk => 'ca-app-pub-7477781478326336/8049594064',

      Flavor.qlm => 'ca-app-pub-7477781478326336/5932522956',

      Flavor.haqe => 'ca-app-pub-7477781478326336/3909010753',

      Flavor.mraj => 'ca-app-pub-7477781478326336/1223121750',

      Flavor.noh => 'ca-app-pub-7477781478326336/5245293095',

      Flavor.jen => 'ca-app-pub-7477781478326336/6678628419',

      Flavor.mozamel => 'ca-app-pub-7477781478326336/3738223004',

      Flavor.mdser => 'ca-app-pub-7477781478326336/8274055507',

      Flavor.ghiyamt => 'ca-app-pub-7477781478326336/3163507937',

      Flavor.nsan => 'ca-app-pub-7477781478326336/6044860134',

      Flavor.mrslt => 'ca-app-pub-7477781478326336/5825368281',

      Flavor.naba => 'ca-app-pub-7477781478326336/1926447882',

      Flavor.nazat => 'ca-app-pub-7477781478326336/1842687408',

      Flavor.abas => 'ca-app-pub-7477781478326336/7645192043',

      Flavor.takwir => 'ca-app-pub-7477781478326336/5696503630',

      Flavor.nftar => 'ca-app-pub-7477781478326336/6157514541',

      Flavor.mtffin => 'ca-app-pub-7477781478326336/2446280490',

      Flavor.nshqaq => 'ca-app-pub-7477781478326336/1799413235',

      Flavor.broj => 'ca-app-pub-7477781478326336/2322173329',

      Flavor.taregh => 'ca-app-pub-7477781478326336/1998777681',

      Flavor.ala => 'ca-app-pub-7477781478326336/8177135233',

      Flavor.qashie => 'ca-app-pub-7477781478326336/6404888564',

      Flavor.fajr => 'ca-app-pub-7477781478326336/5025115173',

      Flavor.balad => 'ca-app-pub-7477781478326336/4791760004',

      Flavor.shams => 'ca-app-pub-7477781478326336/5483507370',

      Flavor.layl => 'ca-app-pub-7477781478326336/8919409253',

      Flavor.zoha => 'ca-app-pub-7477781478326336/6321166073',

      Flavor.sharh => 'ca-app-pub-7477781478326336/1815221769',
      Flavor.tin => 'ca-app-pub-7477781478326336/6482182948',
      Flavor.alaq => 'ca-app-pub-7477781478326336/3723199807',
      Flavor.qadr => 'ca-app-pub-7477781478326336/8266037902',
      Flavor.bayyina => 'ca-app-pub-7477781478326336/9663396975',
      Flavor.zalzalah => 'ca-app-pub-7477781478326336/7037233636',
      Flavor.adiyat => 'ca-app-pub-7477781478326336/5071940499',
      Flavor.qariah => 'ca-app-pub-7477781478326336/1964353438',
      Flavor.takathur => 'ca-app-pub-7477781478326336/4768688160',
      Flavor.asr => 'ca-app-pub-7477781478326336/5341008587',
      Flavor.humazah => 'ca-app-pub-7477781478326336/9047678672',
      Flavor.fil => 'ca-app-pub-7477781478326336/3433347773',
      Flavor.quraysh => 'ca-app-pub-7477781478326336/9942915806',
      Flavor.maun => 'ca-app-pub-7477781478326336/8664535297',
      Flavor.kawthar => 'ca-app-pub-7477781478326336/7739941215',
      Flavor.kafirun => 'ca-app-pub-7477781478326336/5237384039',
      Flavor.nasr => 'ca-app-pub-7477781478326336/4283395015',
      Flavor.masad => 'ca-app-pub-7477781478326336/6393595173',
      Flavor.ikhlas => 'ca-app-pub-7477781478326336/1114823114',
      Flavor.falaq => 'ca-app-pub-7477781478326336/5456875885',
      Flavor.nas => 'ca-app-pub-7477781478326336/8610169756',
    };
  }

  static String get bannerAdToken {
    return switch (appFlavor) {
      Flavor.fatiha => ['ca-app-pub-7477781478326336/3609743062'].first,

      Flavor.baqareh => ['ca-app-pub-7477781478326336/4219048702'].first,
      Flavor.emran => [
        'ca-app-pub-7477781478326336/7421581790',
        'ca-app-pub-7477781478326336/9182413696',
      ].elementAt(Random().nextInt(2)),
      Flavor.nesa => ['ca-app-pub-7477781478326336/4983150246'].first,
      Flavor.maede => ['ca-app-pub-7477781478326336/4983150246'].first,
      Flavor.anam => ['ca-app-pub-7477781478326336/5176907159'].first,
      Flavor.eraf => ['ca-app-pub-7477781478326336/8958054274'].first,
      Flavor.anfal => ['ca-app-pub-7477781478326336/8046613073'].first,
      Flavor.tobeh => [
        'ca-app-pub-7477781478326336/7421581790',
        'ca-app-pub-7477781478326336/9182413696',
      ].elementAt(Random().nextInt(2)),
      Flavor.yones => ['ca-app-pub-7477781478326336/2268700458'].first,
      Flavor.hod => ['ca-app-pub-7477781478326336/7273615128'].first,
      Flavor.usef => ['ca-app-pub-7477781478326336/6574583457'].first,
      Flavor.raad => ['ca-app-pub-7477781478326336/3481516250'].first,
      Flavor.ebrahim => ['ca-app-pub-7477781478326336/1785291209'].first,
      Flavor.hajar => ['ca-app-pub-7477781478326336/5149821142'].first,
      Flavor.nahl => ['ca-app-pub-7477781478326336/7201269413'].first,
      Flavor.esra => ['ca-app-pub-7477781478326336/6626554345'].first,
      Flavor.kahf => ['ca-app-pub-7477781478326336/7394525319'].first,
      Flavor.maryam => ['ca-app-pub-7477781478326336/7011381936'].first,
      Flavor.taha => ['ca-app-pub-7477781478326336/8815418192'].first,
      Flavor.anbya => ['ca-app-pub-7477781478326336/2988376441'].first,
      Flavor.haj => ['ca-app-pub-7477781478326336/3122423603'].first,
      Flavor.momenon => ['ca-app-pub-7477781478326336/1617770244'].first,
      Flavor.nor => ['ca-app-pub-7477781478326336/3286075132'].first,
      Flavor.forghan => ['ca-app-pub-7477781478326336/3754006660'].first,
      Flavor.shoara => ['ca-app-pub-7477781478326336/5501174938'].first,
      Flavor.naml => ['ca-app-pub-7477781478326336/6239541538'].first,
      Flavor.ghesas => [
        'ca-app-pub-7477781478326336/3342735985',
        'ca-app-pub-7477781478326336/3622965254',
      ].elementAt(Random().nextInt(2)),
      Flavor.ankaboot => [
        'ca-app-pub-7477781478326336/1838082620',
        'ca-app-pub-7477781478326336/9729208600',
      ].elementAt(Random().nextInt(2)),
      Flavor.rom => [
        'ca-app-pub-7477781478326336/5865985215',
        'ca-app-pub-7477781478326336/3239821871',
      ].elementAt(Random().nextInt(2)),
      Flavor.loghman => [
        'ca-app-pub-7477781478326336/5674413526',
        'ca-app-pub-7477781478326336/3239821871',
      ].elementAt(Random().nextInt(2)),
      Flavor.sajdeh => [
        'ca-app-pub-7477781478326336/4721791486',
        'ca-app-pub-7477781478326336/5078150171',
      ].elementAt(Random().nextInt(2)),
      Flavor.ahzab => ['ca-app-pub-7477781478326336/2408957795'].first,
      Flavor.saba => [
        'ca-app-pub-7477781478326336/7237409650',
        'ca-app-pub-7477781478326336/3298164648',
      ].elementAt(Random().nextInt(2)),
      Flavor.fater => ['ca-app-pub-7477781478326336/8263069646'].first,
      Flavor.yasin => ['ca-app-pub-7477781478326336/5062191239'].first,
      Flavor.safat => ['ca-app-pub-7477781478326336/7690038789'].first,
      Flavor.sad => ['ca-app-pub-7477781478326336/7030906691'].first,
      Flavor.zmr => ['ca-app-pub-7477781478326336/5143109957'].first,
      Flavor.qafr => ['ca-app-pub-7477781478326336/9138195285'].first,
      Flavor.fslat => ['ca-app-pub-7477781478326336/3099400546'].first,
      Flavor.shora => ['ca-app-pub-7477781478326336/7086569403'].first,
      Flavor.zkhrf => ['ca-app-pub-7477781478326336/8123468847'].first,
      Flavor.dokhan => [''].first,
      Flavor.jasieh => ['ca-app-pub-7477781478326336/3718347647'].first,
      Flavor.ahghaf => ['ca-app-pub-7477781478326336/7490728233'].first,
      Flavor.mhmd => ['ca-app-pub-7477781478326336/2976768151'].first,
      Flavor.fath => ['ca-app-pub-7477781478326336/8392746369'].first,
      Flavor.hojrat => ['ca-app-pub-7477781478326336/2104855402'].first,
      Flavor.ghaf => ['ca-app-pub-7477781478326336/9791773738'].first,
      Flavor.zariyat => ['ca-app-pub-7477781478326336/5519171016'].first,
      Flavor.tor => ['ca-app-pub-7477781478326336/5136027638'].first,
      Flavor.najm => ['ca-app-pub-7477781478326336/7928027726'].first,
      Flavor.ghamar => ['ca-app-pub-7477781478326336/6247280396'].first,
      Flavor.alrahman => ['ca-app-pub-7477781478326336/9979475998'].first,
      Flavor.vaqee => ['ca-app-pub-7477781478326336/1909414283'].first,
      Flavor.hadid => ['ca-app-pub-7477781478326336/6012310824'].first,
      Flavor.mojadl => ['ca-app-pub-7477781478326336/8831073520'].first,
      Flavor.hashr => ['ca-app-pub-7477781478326336/4767705433'].first,
      Flavor.momtahn => ['ca-app-pub-7477781478326336/8476506848'].first,
      Flavor.saf => ['ca-app-pub-7477781478326336/7873215075'].first,
      Flavor.jome => ['ca-app-pub-7477781478326336/8783628607'].first,
      Flavor.mnfghn => ['ca-app-pub-7477781478326336/8017341844'].first,
      Flavor.tghbn => ['ca-app-pub-7477781478326336/6320282646'].first,
      Flavor.talagh => ['ca-app-pub-7477781478326336/1251966401'].first,
      Flavor.tahrim => ['ca-app-pub-7477781478326336/3111842981'].first,
      Flavor.molk => ['ca-app-pub-7477781478326336/4971719564'].first,
      Flavor.qlm => ['ca-app-pub-7477781478326336/9406445132'].first,
      Flavor.haqe => ['ca-app-pub-7477781478326336/3383305722'].first,
      Flavor.mraj => ['ca-app-pub-7477781478326336/1303937293'].first,
      Flavor.noh => ['ca-app-pub-7477781478326336/6911487193'].first,
      Flavor.jen => ['ca-app-pub-7477781478326336/7649853799'].first,
      Flavor.mozamel => ['ca-app-pub-7477781478326336/8196648703'].first,
      Flavor.mdser => ['ca-app-pub-7477781478326336/9761668352'].first,
      Flavor.ghiyamt => ['ca-app-pub-7477781478326336/6475345258'].first,
      Flavor.nsan => ['ca-app-pub-7477781478326336/1500034950'].first,
      Flavor.mrslt => ['ca-app-pub-7477781478326336/7921973075'].first,
      Flavor.naba => ['ca-app-pub-7477781478326336/7347258007'].first,
      Flavor.nazat => ['ca-app-pub-7477781478326336/8223541192'].first,
      Flavor.abas => ['ca-app-pub-7477781478326336/9803382027'].first,
      Flavor.takwir => ['ca-app-pub-7477781478326336/9781849652'].first,
      Flavor.nftar => ['ca-app-pub-7477781478326336/3459983882'].first,
      Flavor.mtffin => ['ca-app-pub-7477781478326336/8875962095'].first,
      Flavor.nshqaq => ['ca-app-pub-7477781478326336/6988165353'].first,
      Flavor.broj => ['ca-app-pub-7477781478326336/6413450281'].first,
      Flavor.taregh => ['ca-app-pub-7477781478326336/4337294742'].first,
      Flavor.ala => ['ca-app-pub-7477781478326336/4480764972'].first,
      Flavor.qashie => ['ca-app-pub-7477781478326336/6005599636'].first,
      Flavor.fajr => ['ca-app-pub-7477781478326336/5239312879'].first,
      Flavor.balad => ['ca-app-pub-7477781478326336/3351516131'].first,
      Flavor.shams => ['ca-app-pub-7477781478326336/4413972908'].first,
      Flavor.layl => ['ca-app-pub-7477781478326336/6465421178'].first,
      Flavor.zoha => [
        'ca-app-pub-7477781478326336/5385249854',
        'ca-app-pub-7477781478326336/2759086518',
      ].elementAt(Random().nextInt(2)),

      Flavor.sharh => ['ca-app-pub-7477781478326336/5707323179'].first,
      Flavor.tin => ['ca-app-pub-7477781478326336/6684405062'].first,
      Flavor.alaq => ['ca-app-pub-7477781478326336/3205282917'].first,
      Flavor.qadr => ['ca-app-pub-7477781478326336/9777472260'].first,
      Flavor.bayyina => ['ca-app-pub-7477781478326336/1034415140'].first,
      Flavor.zalzalah => ['ca-app-pub-7477781478326336/3469006790'].first,
      Flavor.adiyat => ['ca-app-pub-7477781478326336/3943649515'].first,
      Flavor.qariah => ['ca-app-pub-7477781478326336/3005014507'].first,
      Flavor.takathur => ['ca-app-pub-7477781478326336/3109914140'].first,
      Flavor.asr => ['ca-app-pub-7477781478326336/3281821451'].first,
      Flavor.humazah => ['ca-app-pub-7477781478326336/3931083366'].first,
      Flavor.fil => ['ca-app-pub-7477781478326336/7798176185'].first,
      Flavor.quraysh => ['ca-app-pub-7477781478326336/7487184995'].first,
      Flavor.maun => ['ca-app-pub-7477781478326336/3050204397'].first,
      Flavor.kawthar => ['ca-app-pub-7477781478326336/1545551038'].first,
      Flavor.kafirun => ['ca-app-pub-7477781478326336/7863547376'].first,
      Flavor.nasr => ['ca-app-pub-7477781478326336/4618953857'].first,
      Flavor.masad => ['ca-app-pub-7477781478326336/5216244875'].first,
      Flavor.ikhlas => ['ca-app-pub-7477781478326336/2427904780'].first,
      Flavor.falaq => ['ca-app-pub-7477781478326336/7544500095'].first,
      Flavor.nas => ['ca-app-pub-7477781478326336/5189799499'].first,
    };
  }

  static String get interstitialAdToken {
    return switch (appFlavor) {
      Flavor.fatiha => ['ca-app-pub-7477781478326336/9469925471'].first,

      Flavor.baqareh => ['ca-app-pub-7477781478326336/6653640351'].first,
      Flavor.emran => [
        'ca-app-pub-7477781478326336/6556250352',
        'ca-app-pub-7477781478326336/2776787444',
      ].elementAt(Random().nextInt(2)),
      Flavor.nesa => ['ca-app-pub-7477781478326336/3478496881'].first,
      Flavor.maede => ['ca-app-pub-7477781478326336/9086046781'].first,
      Flavor.anam => ['ca-app-pub-7477781478326336/1728810259'].first,
      Flavor.eraf => ['ca-app-pub-7477781478326336/3705727592'].first,
      Flavor.anfal => ['ca-app-pub-7477781478326336/2794286391'].first,
      Flavor.tobeh => [
        'ca-app-pub-7477781478326336/6556250352',
        'ca-app-pub-7477781478326336/2776787444',
      ].elementAt(Random().nextInt(2)),
      Flavor.yones => ['ca-app-pub-7477781478326336/7848330193'].first,
      Flavor.hod => ['ca-app-pub-7477781478326336/8395125108'].first,
      Flavor.usef => ['ca-app-pub-7477781478326336/5799917206'].first,
      Flavor.raad => ['ca-app-pub-7477781478326336/1130685082'].first,
      Flavor.ebrahim => ['ca-app-pub-7477781478326336/8159127861'].first,
      Flavor.hajar => ['ca-app-pub-7477781478326336/4303643339'].first,
      Flavor.nahl => ['ca-app-pub-7477781478326336/4383534383'].first,
      Flavor.esra => ['ca-app-pub-7477781478326336/2687309333'].first,
      Flavor.kahf => ['ca-app-pub-7477781478326336/3865687306'].first,
      Flavor.maryam => ['ca-app-pub-7477781478326336/4137806580'].first,
      Flavor.taha => ['ca-app-pub-7477781478326336/6189254855'].first,
      Flavor.anbya => ['ca-app-pub-7477781478326336/6736049761'].first,
      Flavor.haj => ['ca-app-pub-7477781478326336/3808819319'].first,
      Flavor.momenon => ['ca-app-pub-7477781478326336/9113116882'].first,
      Flavor.nor => ['ca-app-pub-7477781478326336/5450231714'].first,
      Flavor.forghan => ['ca-app-pub-7477781478326336/2440924993'].first,
      Flavor.shoara => ['ca-app-pub-7477781478326336/6622684911'].first,
      Flavor.naml => ['ca-app-pub-7477781478326336/7310108299'].first,
      Flavor.ghesas => [
        'ca-app-pub-7477781478326336/2309883585',
        'ca-app-pub-7477781478326336/9996801910',
      ].elementAt(Random().nextInt(2)),
      Flavor.ankaboot => [
        'ca-app-pub-7477781478326336/2118311893',
        'ca-app-pub-7477781478326336/8992564209',
      ].elementAt(Random().nextInt(2)),
      Flavor.rom => [
        'ca-app-pub-7477781478326336/1646510935',
        'ca-app-pub-7477781478326336/1926740204',
      ].elementAt(Random().nextInt(2)),
      Flavor.loghman => [
        'ca-app-pub-7477781478326336/9141857573',
        'ca-app-pub-7477781478326336/7828775904',
      ].elementAt(Random().nextInt(2)),
      Flavor.sajdeh => [
        'ca-app-pub-7477781478326336/4990041335',
        'ca-app-pub-7477781478326336/1573540509',
      ].elementAt(Random().nextInt(2)),
      Flavor.ahzab => ['ca-app-pub-7477781478326336/4160173104'].first,
      Flavor.saba => [
        'ca-app-pub-7477781478326336/8358919632',
        'ca-app-pub-7477781478326336/9396190201',
      ].elementAt(Random().nextInt(2)),
      Flavor.fater => [
        'ca-app-pub-7477781478326336/7401061185',
        'ca-app-pub-7477781478326336/2148734508',
      ].elementAt(Random().nextInt(2)),
      Flavor.yasin => ['ca-app-pub-7477781478326336/8809864550'].first,
      Flavor.safat => [
        'ca-app-pub-7477781478326336/4630399942',
        'ca-app-pub-7477781478326336/7699609930',
      ].elementAt(Random().nextInt(2)),
      Flavor.sad => [
        'ca-app-pub-7477781478326336/5317344390',
        'ca-app-pub-7477781478326336/4004262721',
      ].elementAt(Random().nextInt(2)),
      Flavor.zmr => [
        'ca-app-pub-7477781478326336/5293293669',
        'ca-app-pub-7477781478326336/8873446021',
      ].elementAt(Random().nextInt(2)),
      Flavor.qafr => [
        'ca-app-pub-7477781478326336/2475558635',
        'ca-app-pub-7477781478326336/7536313621',
      ].elementAt(Random().nextInt(2)),
      Flavor.fslat => [
        'ca-app-pub-7477781478326336/6055710995',
        'ca-app-pub-7477781478326336/9476081259',
      ].elementAt(Random().nextInt(2)),
      Flavor.shora => [
        'ca-app-pub-7477781478326336/3684219593',
        'ca-app-pub-7477781478326336/9097162526',
      ].elementAt(Random().nextInt(2)),
      Flavor.zkhrf => [
        'ca-app-pub-7477781478326336/4911533176',
        'ca-app-pub-7477781478326336/1341676024',
      ].elementAt(Random().nextInt(2)),
      Flavor.dokhan => [''].first,
      Flavor.jasieh => ['ca-app-pub-7477781478326336/2691178760'].first,
      Flavor.ahghaf => ['ca-app-pub-7477781478326336/9925319884'].first,
      Flavor.mhmd => ['ca-app-pub-7477781478326336/5219788111'].first,
      Flavor.fath => ['ca-app-pub-7477781478326336/2499607070'].first,
      Flavor.hojrat => ['ca-app-pub-7477781478326336/5355519482'].first,
      Flavor.ghaf => ['ca-app-pub-7477781478326336/7560362065'].first,
      Flavor.zariyat => ['ca-app-pub-7477781478326336/5660957033'].first,
      Flavor.tor => ['ca-app-pub-7477781478326336/4944455940'].first,
      Flavor.najm => ['ca-app-pub-7477781478326336/8898522132'].first,
      Flavor.ghamar => ['ca-app-pub-7477781478326336/6272358794'].first,
      Flavor.alrahman => ['ca-app-pub-7477781478326336/8666394324'].first,
      Flavor.vaqee => ['ca-app-pub-7477781478326336/8091679253'].first,
      Flavor.hadid => ['ca-app-pub-7477781478326336/8446902470'].first,
      Flavor.mojadl => ['ca-app-pub-7477781478326336/8639501838'].first,
      Flavor.hashr => ['ca-app-pub-7477781478326336/2141542093'].first,
      Flavor.momtahn => ['ca-app-pub-7477781478326336/9741487055'].first,
      Flavor.saf => ['ca-app-pub-7477781478326336/1479853651'].first,
      Flavor.jome => ['ca-app-pub-7477781478326336/4844383597'].first,
      Flavor.mnfghn => ['ca-app-pub-7477781478326336/5391178509'].first,
      Flavor.tghbn => ['ca-app-pub-7477781478326336/1068790117'].first,
      Flavor.talagh => ['ca-app-pub-7477781478326336/7625803060'].first,
      Flavor.tahrim => ['ca-app-pub-7477781478326336/8172597971'].first,
      Flavor.molk => ['ca-app-pub-7477781478326336/2345556224'].first,
      Flavor.qlm => ['ca-app-pub-7477781478326336/6780281792'].first,
      Flavor.haqe => ['ca-app-pub-7477781478326336/2070224052'].first,
      Flavor.mraj => ['ca-app-pub-7477781478326336/3738528945'].first,
      Flavor.noh => ['ca-app-pub-7477781478326336/8831730066'].first,
      Flavor.jen => ['ca-app-pub-7477781478326336/7458282102'].first,
      Flavor.mozamel => ['ca-app-pub-7477781478326336/9318158684'].first,
      Flavor.mdser => ['ca-app-pub-7477781478326336/8551871923'].first,
      Flavor.ghiyamt => ['ca-app-pub-7477781478326336/2536100241'].first,
      Flavor.nsan => ['ca-app-pub-7477781478326336/3274466847'].first,
      Flavor.mrslt => ['ca-app-pub-7477781478326336/6608891405'].first,
      Flavor.naba => ['ca-app-pub-7477781478326336/8606684571'].first,
      Flavor.nazat => ['ca-app-pub-7477781478326336/2971214512'].first,
      Flavor.abas => ['ca-app-pub-7477781478326336/7618720743'].first,
      Flavor.takwir => ['ca-app-pub-7477781478326336/5730924003'].first,
      Flavor.nftar => ['ca-app-pub-7477781478326336/8520738875'].first,
      Flavor.mtffin => ['ca-app-pub-7477781478326336/2310553746'].first,
      Flavor.nshqaq => ['ca-app-pub-7477781478326336/3048920347'].first,
      Flavor.broj => ['ca-app-pub-7477781478326336/1161123608'].first,
      Flavor.taregh => ['ca-app-pub-7477781478326336/7298500003'].first,
      Flavor.ala => ['ca-app-pub-7477781478326336/6388743013'].first,
      Flavor.qashie => ['ca-app-pub-7477781478326336/2066354622'].first,
      Flavor.fajr => ['ca-app-pub-7477781478326336/2613149539'].first,
      Flavor.balad => ['ca-app-pub-7477781478326336/7099189452'].first,
      Flavor.shams => ['ca-app-pub-7477781478326336/1787809562'].first,
      Flavor.layl => ['ca-app-pub-7477781478326336/8900012825'].first,
      Flavor.zoha => [
        'ca-app-pub-7477781478326336/1446004848',
        'ca-app-pub-7477781478326336/7819841500',
      ].elementAt(Random().nextInt(2)),
      // ca-app-pub-7477781478326336/9446807731
      Flavor.sharh => ['ca-app-pub-7477781478326336/5815134386'].first,
      Flavor.tin => ['ca-app-pub-7477781478326336/3786778984'].first,
      Flavor.alaq => ['ca-app-pub-7477781478326336/8927425023'].first,
      Flavor.qadr => ['ca-app-pub-7477781478326336/7308696372'].first,
      Flavor.bayyina => ['ca-app-pub-7477781478326336/7327402892'].first,
      Flavor.zalzalah => ['ca-app-pub-7477781478326336/5726546617'].first,
      Flavor.adiyat => ['ca-app-pub-7477781478326336/4405726081'].first,
      Flavor.qariah => ['ca-app-pub-7477781478326336/2630567843'].first,
      Flavor.takathur => ['ca-app-pub-7477781478326336/3631700460'].first,
      Flavor.asr => ['ca-app-pub-7477781478326336/4022582704'].first,
      Flavor.humazah => ['ca-app-pub-7477781478326336/7571903332'].first,
      Flavor.fil => ['ca-app-pub-7477781478326336/7212810683'].first,
      Flavor.quraysh => ['ca-app-pub-7477781478326336/8856106984'].first,
      Flavor.maun => ['ca-app-pub-7477781478326336/9977616965'].first,
      Flavor.kawthar => ['ca-app-pub-7477781478326336/9727293380'].first,
      Flavor.kafirun => ['ca-app-pub-7477781478326336/6550465701'].first,
      Flavor.nasr => ['ca-app-pub-7477781478326336/2645921856'].first,
      Flavor.masad => ['ca-app-pub-7477781478326336/2590081532'].first,
      Flavor.ikhlas => ['ca-app-pub-7477781478326336/2156442041'].first,
      Flavor.falaq => ['ca-app-pub-7477781478326336/9129044502'].first,
      Flavor.nas => ['ca-app-pub-7477781478326336/6570647000'].first,
    };
  }
}
