
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
      Flavor.fatiha => 'ca-app-pub-7477781478326336/2378461337',
      Flavor.baqareh => 'ca-app-pub-7477781478326336/7634209756',
      Flavor.emran => 'ca-app-pub-7477781478326336/6953653675',
      Flavor.nesa => 'ca-app-pub-7477781478326336/7463298877',
      Flavor.maede => 'ca-app-pub-7477781478326336/7934072169',
      Flavor.anam => 'ca-app-pub-7477781478326336/2921526431',
      Flavor.eraf => 'ca-app-pub-7477781478326336/3763727016',
      Flavor.anfal => 'ca-app-pub-7477781478326336/4697534730',
      Flavor.tobeh => 'ca-app-pub-7477781478326336/2259073652',
      Flavor.yones => 'ca-app-pub-7477781478326336/6309999303',
      Flavor.hod => 'ca-app-pub-7477781478326336/6429418808',
      Flavor.usef => 'ca-app-pub-7477781478326336/9958976418',
      Flavor.raad => 'ca-app-pub-7477781478326336/8062064671',
      Flavor.ebrahim => 'ca-app-pub-7477781478326336/5435901333',
      Flavor.hajar => 'ca-app-pub-7477781478326336/3544342968',
      Flavor.nahl => 'ca-app-pub-7477781478326336/9196673637',
      Flavor.esra => 'ca-app-pub-7477781478326336/9918179626',
      Flavor.kahf => 'ca-app-pub-7477781478326336/7550928788',
      Flavor.maryam => 'ca-app-pub-7477781478326336/7880556683',
      Flavor.taha => 'ca-app-pub-7477781478326336/2628230000',
      Flavor.anbya => 'ca-app-pub-7477781478326336/7685115568',
      Flavor.haj => 'ca-app-pub-7477781478326336/8437469195',
      Flavor.momenon => 'ca-app-pub-7477781478326336/6100571157',
      Flavor.nor => 'ca-app-pub-7477781478326336/7124387529',
      Flavor.forghan => 'ca-app-pub-7477781478326336/1425446082',
      Flavor.shoara => 'ca-app-pub-7477781478326336/6551997292',
      Flavor.naml => 'ca-app-pub-7477781478326336/5572466859',
      Flavor.ghesas => 'ca-app-pub-7477781478326336/6966930263',
      Flavor.ankaboot => 'ca-app-pub-7477781478326336/4200617387',
      Flavor.rom => 'ca-app-pub-7477781478326336/1574454042',
      Flavor.loghman => 'ca-app-pub-7477781478326336/3734262263',
      Flavor.sajdeh => 'ca-app-pub-7477781478326336/5380895162',
      Flavor.ahzab => 'ca-app-pub-7477781478326336/8166840609',
      Flavor.saba => 'ca-app-pub-7477781478326336/9128568488',
      Flavor.fater => 'ca-app-pub-7477781478326336/3668466045',
      Flavor.yasin => 'ca-app-pub-7477781478326336/1280724282',
      Flavor.safat => 'ca-app-pub-7477781478326336/6119261760',
      Flavor.sad => 'ca-app-pub-7477781478326336/2918383357',
      Flavor.zmr => 'ca-app-pub-7477781478326336/3517149155',
      Flavor.qafr => 'ca-app-pub-7477781478326336/9282102419',
      Flavor.fslat => 'ca-app-pub-7477781478326336/8601954878',
      Flavor.shora => 'ca-app-pub-7477781478326336/8605824309',
      Flavor.zkhrf => 'ca-app-pub-7477781478326336/2830753447',
      Flavor.dokhan => 'ca-app-pub-7477781478326336/4990012925',
      Flavor.jasieh => 'ca-app-pub-7477781478326336/3019397652',
      Flavor.ahghaf => 'ca-app-pub-7477781478326336/3917546359',
      Flavor.mhmd => 'ca-app-pub-7477781478326336/6847510760',
      Flavor.fath => 'ca-app-pub-7477781478326336/8978301340',
      Flavor.hojrat => 'ca-app-pub-7477781478326336/2109640664',
      Flavor.ghaf => 'ca-app-pub-7477781478326336/3433388670',
      Flavor.zariyat => 'ca-app-pub-7477781478326336/2333550683',
      Flavor.tor => 'ca-app-pub-7477781478326336/4245398150',
      Flavor.najm => 'ca-app-pub-7477781478326336/8707387346',
      Flavor.ghamar => 'ca-app-pub-7477781478326336/8626947556',
      Flavor.alrahman => 'ca-app-pub-7477781478326336/7993071478',
      Flavor.vaqee => 'ca-app-pub-7477781478326336/5829393827',
      Flavor.hadid => 'ca-app-pub-7477781478326336/4610738971',
      Flavor.mojadl => 'ca-app-pub-7477781478326336/7218497119',
      Flavor.hashr => 'ca-app-pub-7477781478326336/6676351302',
      Flavor.momtahn => 'ca-app-pub-7477781478326336/6652069640',
      Flavor.saf => 'ca-app-pub-7477781478326336/4272769571',
      Flavor.jome => 'ca-app-pub-7477781478326336/3525148745',
      Flavor.mnfghn => 'ca-app-pub-7477781478326336/4197557421',
      Flavor.tghbn => 'ca-app-pub-7477781478326336/4102188651',
      Flavor.talagh => 'ca-app-pub-7477781478326336/3663204955',
      Flavor.tahrim => 'ca-app-pub-7477781478326336/3325838196',
      Flavor.molk => 'ca-app-pub-7477781478326336/9260691151',
      Flavor.qlm => 'ca-app-pub-7477781478326336/6526716609',
      Flavor.haqe => 'ca-app-pub-7477781478326336/8285794487',
      Flavor.mraj => 'ca-app-pub-7477781478326336/6844720309',
      Flavor.noh => 'ca-app-pub-7477781478326336/9316531470',
      Flavor.jen => 'ca-app-pub-7477781478326336/7108444187',
      Flavor.mozamel => 'ca-app-pub-7477781478326336/3433649409',
      Flavor.mdser => 'ca-app-pub-7477781478326336/9543035838',
      Flavor.ghiyamt => 'ca-app-pub-7477781478326336/5739522191',
      Flavor.nsan => 'ca-app-pub-7477781478326336/7982542153',
      Flavor.mrslt => 'ca-app-pub-7477781478326336/3113358853',
      Flavor.naba => 'ca-app-pub-7477781478326336/8845758185',
      Flavor.nazat => 'ca-app-pub-7477781478326336/2730215475',
      Flavor.abas => 'ca-app-pub-7477781478326336/5676669363',
      Flavor.takwir => 'ca-app-pub-7477781478326336/9842418734',
      Flavor.nftar => 'ca-app-pub-7477781478326336/4590092057',
      Flavor.mtffin => 'ca-app-pub-7477781478326336/9483326089',
      Flavor.nshqaq => 'ca-app-pub-7477781478326336/5886861857',
      Flavor.broj => 'ca-app-pub-7477781478326336/9634535172',
      Flavor.taregh => 'ca-app-pub-7477781478326336/5711602038',
      Flavor.ala => 'ca-app-pub-7477781478326336/8271043110',
      Flavor.qashie => 'ca-app-pub-7477781478326336/8813968594',
      Flavor.fajr => 'ca-app-pub-7477781478326336/8692988590',
      Flavor.balad => 'ca-app-pub-7477781478326336/1865416866',
      Flavor.shams => 'ca-app-pub-7477781478326336/4878593014',
      Flavor.layl => 'ca-app-pub-7477781478326336/5309837858',
      Flavor.zoha => 'ca-app-pub-7477781478326336/3628364177',
      Flavor.sharh => 'ca-app-pub-7477781478326336/5285787124',
      Flavor.tin => 'ca-app-pub-7477781478326336/1681584039',
      Flavor.alaq => 'ca-app-pub-7477781478326336/8406048139',
      Flavor.qadr => 'ca-app-pub-7477781478326336/2803094011',
      Flavor.bayyina => 'ca-app-pub-7477781478326336/6170767031',
      Flavor.zalzalah => 'ca-app-pub-7477781478326336/6550767336',
      Flavor.adiyat => 'ca-app-pub-7477781478326336/1649068093',
      Flavor.qariah => 'ca-app-pub-7477781478326336/2959006680',
      Flavor.takathur => 'ca-app-pub-7477781478326336/6465462261',
      Flavor.asr => 'ca-app-pub-7477781478326336/2579006382',
      Flavor.humazah => 'ca-app-pub-7477781478326336/6625244364',
      Flavor.fil => 'ca-app-pub-7477781478326336/9914570929',
      Flavor.quraysh => 'ca-app-pub-7477781478326336/6024153721',
      Flavor.maun => 'ca-app-pub-7477781478326336/1454353321',
      Flavor.kawthar => 'ca-app-pub-7477781478326336/9059836010',
      Flavor.kafirun => 'ca-app-pub-7477781478326336/3888944976',
      Flavor.nasr => 'ca-app-pub-7477781478326336/5832582032',
      Flavor.masad => 'ca-app-pub-7477781478326336/9531427546',
      Flavor.ikhlas => 'ca-app-pub-7477781478326336/1153425836',
      Flavor.falaq => 'ca-app-pub-7477781478326336/1528830357',
      Flavor.nas => 'ca-app-pub-7477781478326336/7352002676',
    };
  }

  static String get bannerAdToken {
    return switch (appFlavor) {
      Flavor.fatiha => ['ca-app-pub-7477781478326336/9941148781'].first,
      Flavor.baqareh => ['ca-app-pub-7477781478326336/1815374855'].first,
      Flavor.emran => ['ca-app-pub-7477781478326336/9019923126'].first,
      Flavor.nesa => ['ca-app-pub-7477781478326336/3639592415'].first,
      Flavor.maede => ['ca-app-pub-7477781478326336/6390697075'].first,
      Flavor.anam => ['ca-app-pub-7477781478326336/7619377634'].first,
      Flavor.eraf => ['ca-app-pub-7477781478326336/7427805944'].first,
      Flavor.anfal => ['ca-app-pub-7477781478326336/1928707888'].first,
      Flavor.tobeh => ['ca-app-pub-7477781478326336/6669199751'].first,
      Flavor.yones => ['ca-app-pub-7477781478326336/5840032739'].first,
      Flavor.hod => ['ca-app-pub-7477781478326336/4753363533'].first,
      Flavor.usef => ['ca-app-pub-7477781478326336/6211303092'].first,
      Flavor.raad => ['ca-app-pub-7477781478326336/7779800368'].first,
      Flavor.ebrahim => ['ca-app-pub-7477781478326336/3767584928'].first,
      Flavor.hajar => ['ca-app-pub-7477781478326336/5527389152'].first,
      Flavor.nahl => ['ca-app-pub-7477781478326336/4602972681'].first,
      Flavor.esra => ['ca-app-pub-7477781478326336/4103638605'].first,
      Flavor.kahf => ['ca-app-pub-7477781478326336/1496656322'].first,
      Flavor.maryam => ['ca-app-pub-7477781478326336/1561876373'].first,
      Flavor.taha => ['ca-app-pub-7477781478326336/5688183013'].first,
      Flavor.anbya => ['ca-app-pub-7477781478326336/1323037371'].first,
      Flavor.haj => ['ca-app-pub-7477781478326336/4408365716'].first,
      Flavor.momenon => ['ca-app-pub-7477781478326336/8187187999'].first,
      Flavor.nor => ['ca-app-pub-7477781478326336/3349310151'].first,
      Flavor.forghan => ['ca-app-pub-7477781478326336/3245674894'].first,
      Flavor.shoara => ['ca-app-pub-7477781478326336/9193788530'].first,
      Flavor.naml => ['ca-app-pub-7477781478326336/8427501773'].first,
      Flavor.ghesas => ['ca-app-pub-7477781478326336/6826780729'].first,
      Flavor.ankaboot => ['ca-app-pub-7477781478326336/1493621046'].first,
      Flavor.rom => ['ca-app-pub-7477781478326336/7867457703'].first,
      Flavor.loghman => ['ca-app-pub-7477781478326336/6360425608'].first,
      Flavor.sajdeh => ['ca-app-pub-7477781478326336/8007058500'].first,
      Flavor.ahzab => ['ca-app-pub-7477781478326336/4067813498'].first,
      Flavor.saba => ['ca-app-pub-7477781478326336/6168853916'].first,
      Flavor.fater => ['ca-app-pub-7477781478326336/7815486818'].first,
      Flavor.yasin => ['ca-app-pub-7477781478326336/9771732403'].first,
      Flavor.safat => ['ca-app-pub-7477781478326336/6103057698'].first,
      Flavor.sad => ['ca-app-pub-7477781478326336/4231465027'].first,
      Flavor.zmr => ['ca-app-pub-7477781478326336/8463296026'].first,
      Flavor.qafr => ['ca-app-pub-7477781478326336/5536807833'].first,
      Flavor.fslat => ['ca-app-pub-7477781478326336/5837132684'].first,
      Flavor.shora => ['ca-app-pub-7477781478326336/7288873204'].first,
      Flavor.zkhrf => ['ca-app-pub-7477781478326336/1242339600'].first,
      Flavor.dokhan => ['ca-app-pub-7477781478326336/4638659138'].first,
      Flavor.jasieh => ['ca-app-pub-7477781478326336/1928735319'].first,
      Flavor.ahghaf => ['ca-app-pub-7477781478326336/3760691737'].first,
      Flavor.mhmd => ['ca-app-pub-7477781478326336/4606869549'].first,
      Flavor.fath => ['ca-app-pub-7477781478326336/6890908647'].first,
      Flavor.hojrat => ['ca-app-pub-7477781478326336/8438303340'].first,
      Flavor.ghaf => ['ca-app-pub-7477781478326336/2204067487'].first,
      Flavor.zariyat => ['ca-app-pub-7477781478326336/9639704373'].first,
      Flavor.tor => ['ca-app-pub-7477781478326336/5558479826'].first,
      Flavor.najm => ['ca-app-pub-7477781478326336/1020469015'].first,
      Flavor.ghamar => ['ca-app-pub-7477781478326336/7334047185'].first,
      Flavor.alrahman => ['ca-app-pub-7477781478326336/2631608985'].first,
      Flavor.vaqee => ['ca-app-pub-7477781478326336/3178403893'].first,
      Flavor.hadid => ['ca-app-pub-7477781478326336/5923820644'].first,
      Flavor.mojadl => ['ca-app-pub-7477781478326336/6139443068'].first,
      Flavor.hashr => ['ca-app-pub-7477781478326336/8825304634'].first,
      Flavor.momtahn => ['ca-app-pub-7477781478326336/3881601927'].first,
      Flavor.saf => ['ca-app-pub-7477781478326336/5804401148'].first,
      Flavor.jome => ['ca-app-pub-7477781478326336/6937507898'].first,
      Flavor.mnfghn => ['ca-app-pub-7477781478326336/7265083205'].first,
      Flavor.tghbn => ['ca-app-pub-7477781478326336/4601700341'].first,
      Flavor.talagh => ['ca-app-pub-7477781478326336/1975537000'].first,
      Flavor.tahrim => ['ca-app-pub-7477781478326336/8349373660'].first,
      Flavor.molk => ['ca-app-pub-7477781478326336/6918978989'].first,
      Flavor.qlm => ['ca-app-pub-7477781478326336/3097046982'].first,
      Flavor.haqe => ['ca-app-pub-7477781478326336/7849861979'].first,
      Flavor.mraj => ['ca-app-pub-7477781478326336/8157801977'].first,
      Flavor.noh => ['ca-app-pub-7477781478326336/5576597014'].first,
      Flavor.jen => ['ca-app-pub-7477781478326336/9037329877'].first,
      Flavor.mozamel => ['ca-app-pub-7477781478326336/6059812742'].first,
      Flavor.mdser => ['ca-app-pub-7477781478326336/6698106993'].first,
      Flavor.ghiyamt => ['ca-app-pub-7477781478326336/3835413585'].first,
      Flavor.nsan => ['ca-app-pub-7477781478326336/7891769168'].first,
      Flavor.mrslt => ['ca-app-pub-7477781478326336/2758861989'].first,
      Flavor.naba => ['ca-app-pub-7477781478326336/1800277186'].first,
      Flavor.nazat => ['ca-app-pub-7477781478326336/7819616976'].first,
      Flavor.abas => ['ca-app-pub-7477781478326336/9674897774'].first,
      Flavor.takwir => ['ca-app-pub-7477781478326336/4000625619'].first,
      Flavor.nftar => ['ca-app-pub-7477781478326336/4422571096'].first,
      Flavor.mtffin => ['ca-app-pub-7477781478326336/5934145070'].first,
      Flavor.nshqaq => ['ca-app-pub-7477781478326336/4523369792'].first,
      Flavor.broj => ['ca-app-pub-7477781478326336/4230999408'].first,
      Flavor.taregh => ['ca-app-pub-7477781478326336/4621063405'].first,
      Flavor.ala => ['ca-app-pub-7477781478326336/3085438699'].first,
      Flavor.qashie => ['ca-app-pub-7477781478326336/3069126829'].first,
      Flavor.fajr => ['ca-app-pub-7477781478326336/5860502197'].first,
      Flavor.balad => ['ca-app-pub-7477781478326336/9009409716'].first,
      Flavor.shams => ['ca-app-pub-7477781478326336/8438564072'].first,
      Flavor.layl => ['ca-app-pub-7477781478326336/8434694640'].first,
      Flavor.zoha => ['ca-app-pub-7477781478326336/3996756181'].first,
      Flavor.sharh => ['ca-app-pub-7477781478326336/7675420399'].first,
      Flavor.tin => ['ca-app-pub-7477781478326336/2032211473'].first,
      Flavor.alaq => ['ca-app-pub-7477781478326336/8055420696'].first,
      Flavor.qadr => ['ca-app-pub-7477781478326336/2029068392'].first,
      Flavor.bayyina => ['ca-app-pub-7477781478326336/3100932323'].first,
      Flavor.zalzalah => ['ca-app-pub-7477781478326336/6550040984'].first,
      Flavor.adiyat => ['ca-app-pub-7477781478326336/1154970425'].first,
      Flavor.qariah => ['ca-app-pub-7477781478326336/5503734382'].first,
      Flavor.takathur => ['ca-app-pub-7477781478326336/7778543939'].first,
      Flavor.asr => ['ca-app-pub-7477781478326336/2526217258'].first,
      Flavor.humazah => ['ca-app-pub-7477781478326336/7480705628'].first,
      Flavor.fil => ['ca-app-pub-7477781478326336/2039950333'].first,
      Flavor.quraysh => ['ca-app-pub-7477781478326336/2387434698'].first,
      Flavor.maun => ['ca-app-pub-7477781478326336/5393598333'].first,
      Flavor.kawthar => ['ca-app-pub-7477781478326336/7828189985'].first,
      Flavor.kafirun => ['ca-app-pub-7477781478326336/9829992200'].first,
      Flavor.nasr => ['ca-app-pub-7477781478326336/1844509210'].first,
      Flavor.masad => ['ca-app-pub-7477781478326336/3541460618'].first,
      Flavor.ikhlas => ['ca-app-pub-7477781478326336/7543574363'].first,
      Flavor.falaq => ['ca-app-pub-7477781478326336/3604329353'].first,
      Flavor.nas => ['ca-app-pub-7477781478326336/9978166011'].first,
    };
  }

  static String get interstitialAdToken {
    return switch (appFlavor) {
      Flavor.fatiha => ['ca-app-pub-7477781478326336/2456699996'].first,
      Flavor.baqareh => ['ca-app-pub-7477781478326336/5563048170'].first,
      Flavor.emran => ['ca-app-pub-7477781478326336/4126796892'].first,
      Flavor.nesa => ['ca-app-pub-7477781478326336/6074184067'].first,
      Flavor.maede => ['ca-app-pub-7477781478326336/3764533733'].first,
      Flavor.anam => ['ca-app-pub-7477781478326336/4419139852'].first,
      Flavor.eraf => ['ca-app-pub-7477781478326336/3816504625'].first,
      Flavor.anfal => ['ca-app-pub-7477781478326336/8549315922'].first,
      Flavor.tobeh => ['ca-app-pub-7477781478326336/9758289726'].first,
      Flavor.yones => ['ca-app-pub-7477781478326336/9587706051'].first,
      Flavor.hod => ['ca-app-pub-7477781478326336/4050655950'].first,
      Flavor.usef => ['ca-app-pub-7477781478326336/4400879049'].first,
      Flavor.raad => ['ca-app-pub-7477781478326336/1360913437'].first,
      Flavor.ebrahim => ['ca-app-pub-7477781478326336/4405879173'].first,
      Flavor.hajar => ['ca-app-pub-7477781478326336/9116932767'].first,
      Flavor.nahl => ['ca-app-pub-7477781478326336/4411400991'].first,
      Flavor.esra => ['ca-app-pub-7477781478326336/3912066919'].first,
      Flavor.kahf => ['ca-app-pub-7477781478326336/9179705226'].first,
      Flavor.maryam => ['ca-app-pub-7477781478326336/5581012433'].first,
      Flavor.taha => ['ca-app-pub-7477781478326336/5895054811'].first,
      Flavor.anbya => ['ca-app-pub-7477781478326336/9880184245'].first,
      Flavor.haj => ['ca-app-pub-7477781478326336/3805730489'].first,
      Flavor.momenon => ['ca-app-pub-7477781478326336/7804044618'].first,
      Flavor.nor => ['ca-app-pub-7477781478326336/9723146817'].first,
      Flavor.forghan => ['ca-app-pub-7477781478326336/2347526198'].first,
      Flavor.shoara => ['ca-app-pub-7477781478326336/1315298511'].first,
      Flavor.naml => ['ca-app-pub-7477781478326336/2155954503'].first,
      Flavor.ghesas => ['ca-app-pub-7477781478326336/2806702719'].first,
      Flavor.ankaboot => ['ca-app-pub-7477781478326336/2946303514'].first,
      Flavor.rom => ['ca-app-pub-7477781478326336/7867457703'].first,
      Flavor.loghman => ['ca-app-pub-7477781478326336/5047343932'].first,
      Flavor.sajdeh => ['ca-app-pub-7477781478326336/8970277072'].first,
      Flavor.ahzab => ['ca-app-pub-7477781478326336/3928212699'].first,
      Flavor.saba => ['ca-app-pub-7477781478326336/4925707396'].first,
      Flavor.fater => ['ca-app-pub-7477781478326336/2914513924'].first,
      Flavor.yasin => ['ca-app-pub-7477781478326336/6035489767'].first,
      Flavor.safat => ['ca-app-pub-7477781478326336/7432343439'].first,
      Flavor.sad => ['ca-app-pub-7477781478326336/9068858731'].first,
      Flavor.zmr => ['ca-app-pub-7477781478326336/1709243467'].first,
      Flavor.qafr => ['ca-app-pub-7477781478326336/4544232310'].first,
      Flavor.fslat => ['ca-app-pub-7477781478326336/8601954878'].first,
      Flavor.shora => ['ca-app-pub-7477781478326336/3334807016'].first,
      Flavor.zkhrf => ['ca-app-pub-7477781478326336/8929257936'].first,
      Flavor.dokhan => ['ca-app-pub-7477781478326336/8410383187'].first,
      Flavor.jasieh => ['ca-app-pub-7477781478326336/8395562004'].first,
      Flavor.ahghaf => ['ca-app-pub-7477781478326336/2447610061'].first,
      Flavor.mhmd => ['ca-app-pub-7477781478326336/2301212356'].first,
      Flavor.fath => ['ca-app-pub-7477781478326336/7041461199'].first,
      Flavor.hojrat => ['ca-app-pub-7477781478326336/2109640664'].first,
      Flavor.ghaf => ['ca-app-pub-7477781478326336/7150214358'].first,
      Flavor.zariyat => ['ca-app-pub-7477781478326336/3646632356'].first,
      Flavor.tor => ['ca-app-pub-7477781478326336/7013541030'].first,
      Flavor.najm => ['ca-app-pub-7477781478326336/9960210525'].first,
      Flavor.ghamar => ['ca-app-pub-7477781478326336/7394305673'].first,
      Flavor.alrahman => ['ca-app-pub-7477781478326336/5066200631'].first,
      Flavor.vaqee => ['ca-app-pub-7477781478326336/6965428056'].first,
      Flavor.hadid => ['ca-app-pub-7477781478326336/6187544524'].first,
      Flavor.mojadl => ['ca-app-pub-7477781478326336/5809212527'].first,
      Flavor.hashr => ['ca-app-pub-7477781478326336/2001053591'].first,
      Flavor.momtahn => ['ca-app-pub-7477781478326336/5732248951'].first,
      Flavor.saf => ['ca-app-pub-7477781478326336/7773579623'].first,
      Flavor.jome => ['ca-app-pub-7477781478326336/8806775720'].first,
      Flavor.mnfghn => ['ca-app-pub-7477781478326336/5840320897'].first,
      Flavor.tghbn => ['ca-app-pub-7477781478326336/3288618674'].first,
      Flavor.talagh => ['ca-app-pub-7477781478326336/4391507857'].first,
      Flavor.tahrim => ['ca-app-pub-7477781478326336/8723959940'].first,
      Flavor.molk => ['ca-app-pub-7477781478326336/4759719504'].first,
      Flavor.qlm => ['ca-app-pub-7477781478326336/9653898236'].first,
      Flavor.haqe => ['ca-app-pub-7477781478326336/5714653227'].first,
      Flavor.mraj => ['ca-app-pub-7477781478326336/1379822393'].first,
      Flavor.noh => ['ca-app-pub-7477781478326336/1337242751'].first,
      Flavor.jen => ['ca-app-pub-7477781478326336/9324270330'].first,
      Flavor.mozamel => ['ca-app-pub-7477781478326336/4746731075'].first,
      Flavor.mdser => ['ca-app-pub-7477781478326336/1991848872'].first,
      Flavor.ghiyamt => ['ca-app-pub-7477781478326336/8751880100'].first,
      Flavor.nsan => ['ca-app-pub-7477781478326336/2471921524'].first,
      Flavor.mrslt => ['ca-app-pub-7477781478326336/7438798430'].first,
      Flavor.naba => ['ca-app-pub-7477781478326336/2522331913'].first,
      Flavor.nazat => ['ca-app-pub-7477781478326336/5265605826'].first,
      Flavor.abas => ['ca-app-pub-7477781478326336/8720908755'].first,
      Flavor.takwir => ['ca-app-pub-7477781478326336/9775696479'].first,
      Flavor.nftar => ['ca-app-pub-7477781478326336/5903173722'].first,
      Flavor.mtffin => ['ca-app-pub-7477781478326336/1963928712'].first,
      Flavor.nshqaq => ['ca-app-pub-7477781478326336/8513025197'].first,
      Flavor.broj => ['ca-app-pub-7477781478326336/7024683701'].first,
      Flavor.taregh => ['ca-app-pub-7477781478326336/4172016003'].first,
      Flavor.ala => ['ca-app-pub-7477781478326336/7748298939'].first,
      Flavor.qashie => ['ca-app-pub-7477781478326336/2667362643'].first,
      Flavor.fajr => ['ca-app-pub-7477781478326336/2319151935'].first,
      Flavor.balad => ['ca-app-pub-7477781478326336/4310890457'].first,
      Flavor.shams => ['ca-app-pub-7477781478326336/9431355195'].first,
      Flavor.layl => ['ca-app-pub-7477781478326336/7567609180'].first,
      Flavor.zoha => ['ca-app-pub-7477781478326336/1301583737'].first,
      Flavor.sharh => ['ca-app-pub-7477781478326336/3972705454'].first,
      Flavor.tin => ['ca-app-pub-7477781478326336/9033460444'].first,
      Flavor.alaq => ['ca-app-pub-7477781478326336/6742339029'].first,
      Flavor.qadr => ['ca-app-pub-7477781478326336/5428531002'].first,
      Flavor.bayyina => ['ca-app-pub-7477781478326336/9176204324'].first,
      Flavor.zalzalah => ['ca-app-pub-7477781478326336/8161687317'].first,
      Flavor.adiyat => ['ca-app-pub-7477781478326336/5535523975'].first,
      Flavor.qariah => ['ca-app-pub-7477781478326336/6657033957'].first,
      Flavor.takathur => ['ca-app-pub-7477781478326336/2877571047'].first,
      Flavor.asr => ['ca-app-pub-7477781478326336/8900053917'].first,
      Flavor.humazah => ['ca-app-pub-7477781478326336/9963398735'].first,
      Flavor.fil => ['ca-app-pub-7477781478326336/5013598038'].first,
      Flavor.quraysh => ['ca-app-pub-7477781478326336/8708482229'].first,
      Flavor.maun => ['ca-app-pub-7477781478326336/2685999353'].first,
      Flavor.kawthar => ['ca-app-pub-7477781478326336/9771827044'].first,
      Flavor.kafirun => ['ca-app-pub-7477781478326336/3807509338'].first,
      Flavor.nasr => ['ca-app-pub-7477781478326336/1844509210'].first,
      Flavor.masad => ['ca-app-pub-7477781478326336/1848378646'].first,
      Flavor.ikhlas => ['ca-app-pub-7477781478326336/6067659409'].first,
      Flavor.falaq => ['ca-app-pub-7477781478326336/6142846877'].first,
      Flavor.nas => ['ca-app-pub-7477781478326336/8665084345'].first,
    };
  }
}
