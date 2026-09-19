import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
    create("fatiha") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fatiha"
        resValue(type = "string", name = "app_name", value = "سورة الفاتحة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4453852538")
    }
    create("baqareh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.baqareh"
        resValue(type = "string", name = "app_name", value = "سورة البقرة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4505117377")
    }
    create("emran") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.emran"
        resValue(type = "string", name = "app_name", value = "سورة آل عمران")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5439878562")
    }
    create("nesa") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nesa"
        resValue(type = "string", name = "app_name", value = "سورة النساء")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6788499931")
    }
    create("maede") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.maede"
        resValue(type = "string", name = "app_name", value = "سورة المائدة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7913029288")
    }
    create("anam") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.anam"
        resValue(type = "string", name = "app_name", value = "سورة الأنعام")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4610711541")
    }
    create("eraf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.eraf"
        resValue(type = "string", name = "app_name", value = "سورة الأعراف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7755749636")
    }
    create("enfal") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.enfal"
        resValue(type = "string", name = "app_name", value = "سورة الأنفال")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4554871229")
    }
    create("tobeh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.tobeh"
        resValue(type = "string", name = "app_name", value = "سورة التوبة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8075163656")
    }
    create("yones") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.yones"
        resValue(type = "string", name = "app_name", value = "سورة يونس")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8466196075")
    }
    create("hod") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.hod"
        resValue(type = "string", name = "app_name", value = "سورة هود")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8692608545")
    }
    create("usef") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.usef"
        resValue(type = "string", name = "app_name", value = "سورة يوسف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1506105861")
    }
    create("raad") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.raad"
        resValue(type = "string", name = "app_name", value = "سورة الرعد")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6613240111")
    }
    create("ebrahim") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ebrahim"
        resValue(type = "string", name = "app_name", value = "سورة إبراهيم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9019911600")
    }
    create("hajar") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.hajar"
        resValue(type = "string", name = "app_name", value = "سورة الحجر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6682341110")
    }
    create("nahl") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nahl"
        resValue(type = "string", name = "app_name", value = "سورة النحل")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5144245779")
    }
    create("esra") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.esra"
        resValue(type = "string", name = "app_name", value = "سورة الإسراء")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6729801949")
    }
    create("kahf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.kahf"
        resValue(type = "string", name = "app_name", value = "سورة الكهف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8605097958")
    }
    create("maryam") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.maryam"
        resValue(type = "string", name = "app_name", value = "سورة مريم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9711829137")
    }
    create("taha") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.taha"
        resValue(type = "string", name = "app_name", value = "سورة طه")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1025871513")
    }
    create("anbya") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.anbya"
        resValue(type = "string", name = "app_name", value = "سورة الأنبياء")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4071671403")
    }
    create("haj") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.haj"
        resValue(type = "string", name = "app_name", value = "سورة الحج")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1869832284")
    }
    create("momenon") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.momenon"
        resValue(type = "string", name = "app_name", value = "سورة المؤمنون")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8174567943")
    }
    create("nor") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nor"
        resValue(type = "string", name = "app_name", value = "سورة النور")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3596722168")
    }
    create("forghan") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.forghan"
        resValue(type = "string", name = "app_name", value = "سورة الفرقان")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2204055969")
    }
    create("shoara") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.shoara"
        resValue(type = "string", name = "app_name", value = "سورة الشعراء")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7408281182")
    }
    create("naml") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.naml"
        resValue(type = "string", name = "app_name", value = "سورة النمل")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8427501773")
    }
    create("ghesas") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ghesas"
        resValue(type = "string", name = "app_name", value = "سورة القصص")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4259385187")
    }
    create("ankaboot") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ankaboot"
        resValue(type = "string", name = "app_name", value = "سورة العنكبوت")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5513699056")
    }
    create("rom") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.rom"
        resValue(type = "string", name = "app_name", value = "سورة الروم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1283358743")
    }
    create("loghman") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.loghman"
        resValue(type = "string", name = "app_name", value = "سورة لقمان")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6360425608")
    }
    create("sajdeh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.sajdeh"
        resValue(type = "string", name = "app_name", value = "سورة السجدة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4419167288")
    }
    create("ahzab") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ahzab"
        resValue(type = "string", name = "app_name", value = "سورة الأحزاب")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8920792728")
    }
    create("saba") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.saba"
        resValue(type = "string", name = "app_name", value = "سورة سبأ")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4227595590")
    }
    create("fater") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fater"
        resValue(type = "string", name = "app_name", value = "سورة فاطر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6797918619")
    }
    create("yasin") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.yasin"
        resValue(type = "string", name = "app_name", value = "سورة يس")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3885621538")
    }
    create("safat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.safat"
        resValue(type = "string", name = "app_name", value = "سورة الصافات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7416139369")
    }
    create("sad") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.sad"
        resValue(type = "string", name = "app_name", value = "سورة ص")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1106608232")
    }
    create("zmr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.zmr"
        resValue(type = "string", name = "app_name", value = "سورة الزمر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5960970358")
    }
    create("qafr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.qafr"
        resValue(type = "string", name = "app_name", value = "سورة غافر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6575499287")
    }
    create("fslat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fslat"
        resValue(type = "string", name = "app_name", value = "سورة فصلت")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8083080127")
    }
    create("shora") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.shora"
        resValue(type = "string", name = "app_name", value = "سورة الشورى")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5181584615")
    }
    create("zkhrf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.zkhrf"
        resValue(type = "string", name = "app_name", value = "سورة الزخرف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4662709863")
    }
    create("dokhan") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.dokhan"
        resValue(type = "string", name = "app_name", value = "سورة الدخان")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6958642666")
    }
    create("jasieh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.jasieh"
        resValue(type = "string", name = "app_name", value = "سورة الجاثية")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3676931259")
    }
    create("ahghaf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ahghaf"
        resValue(type = "string", name = "app_name", value = "سورة الأحقاف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5073773401")
    }
    create("mhmd") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mhmd"
        resValue(type = "string", name = "app_name", value = "سورة محمد")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3614294022")
    }
    create("fath") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fath"
        resValue(type = "string", name = "app_name", value = "سورة الفتح")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8203990318")
    }
    create("hojrat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.hojrat"
        resValue(type = "string", name = "app_name", value = "سورة الحجرات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3102216181")
    }
    create("ghaf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ghaf"
        resValue(type = "string", name = "app_name", value = "سورة ق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6059552017")
    }
    create("zariyat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.zariyat"
        resValue(type = "string", name = "app_name", value = "سورة الذاريات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1151782218")
    }
    create("tor") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.tor"
        resValue(type = "string", name = "app_name", value = "سورة الطور")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8838700542")
    }
    create("najm") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.najm"
        resValue(type = "string", name = "app_name", value = "سورة النجم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3586373868")
    }
    create("ghamar") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ghamar"
        resValue(type = "string", name = "app_name", value = "سورة القمر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1255723993")
    }
    create("alrahman") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.alrahman"
        resValue(type = "string", name = "app_name", value = "سورة الرحمن")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1510099006")
    }
    create("vaqee") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.vaqee"
        resValue(type = "string", name = "app_name", value = "سورة الواقعة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7117648901")
    }
    create("hadid") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.hadid"
        resValue(type = "string", name = "app_name", value = "سورة الحديد")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7202733988")
    }
    create("mojadl") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mojadl"
        resValue(type = "string", name = "app_name", value = "سورة المجادلة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8435375862")
    }
    create("hashr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.hashr"
        resValue(type = "string", name = "app_name", value = "سورة الحشر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3505706959")
    }
    create("momtahn") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.momtahn"
        resValue(type = "string", name = "app_name", value = "سورة الممتحنة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9278232986")
    }
    create("saf") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.saf"
        resValue(type = "string", name = "app_name", value = "سورة الصف")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1583027057")
    }
    create("jome") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.jome"
        resValue(type = "string", name = "app_name", value = "سورة الجمعة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1311429083")
    }
    create("mnfghn") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mnfghn"
        resValue(type = "string", name = "app_name", value = "سورة المنافقون")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5510639093")
    }
    create("tghbn") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.tghbn"
        resValue(type = "string", name = "app_name", value = "سورة التغابن")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2212067076")
    }
    create("talagh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.talagh"
        resValue(type = "string", name = "app_name", value = "سورة الطلاق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7017671195")
    }
    create("tahrim") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.tahrim"
        resValue(type = "string", name = "app_name", value = "سورة التحريم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1037041613")
    }
    create("molk") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.molk"
        resValue(type = "string", name = "app_name", value = "سورة الملك")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6918978989")
    }
    create("qlm") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.qlm"
        resValue(type = "string", name = "app_name", value = "سورة القلم")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1966979903")
    }
    create("haqe") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.haqe"
        resValue(type = "string", name = "app_name", value = "سورة الحاقة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7027734896")
    }
    create("mraj") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mraj"
        resValue(type = "string", name = "app_name", value = "سورة المعارج")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3033467803")
    }
    create("noh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.noh"
        resValue(type = "string", name = "app_name", value = "سورة نوح")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4218556962")
    }
    create("jen") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.jen"
        resValue(type = "string", name = "app_name", value = "سورة الجن")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8421525859")
    }
    create("mozamel") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mozamel"
        resValue(type = "string", name = "app_name", value = "سورة المزمل")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7372894416")
    }
    create("mdser") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mdser"
        resValue(type = "string", name = "app_name", value = "سورة المدثر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8011188662")
    }
    create("ghiyamt") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ghiyamt"
        resValue(type = "string", name = "app_name", value = "سورة القيامة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5148495251")
    }
    create("nsan") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nsan"
        resValue(type = "string", name = "app_name", value = "سورة الإنسان")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3785003198")
    }
    create("mrslt") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mrslt"
        resValue(type = "string", name = "app_name", value = "سورة المرسلات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7181322728")
    }
    create("naba") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.naba"
        resValue(type = "string", name = "app_name", value = "سورة النبأ")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9132698642")
    }
    create("nazat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nazat"
        resValue(type = "string", name = "app_name", value = "سورة النازعات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4043297147")
    }
    create("abas") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.abas"
        resValue(type = "string", name = "app_name", value = "سورة عبس")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1326360813")
    }
    create("takwir") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.takwir"
        resValue(type = "string", name = "app_name", value = "سورة التكوير")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5313707281")
    }
    create("nftar") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nftar"
        resValue(type = "string", name = "app_name", value = "سورة الإنفطار")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7216255395")
    }
    create("mtffin") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.mtffin"
        resValue(type = "string", name = "app_name", value = "سورة المطففين")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2687543940")
    }
    create("nshqaq") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nshqaq"
        resValue(type = "string", name = "app_name", value = "سورة الإنشقاق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8111261013")
    }
    create("broj") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.broj"
        resValue(type = "string", name = "app_name", value = "سورة البروج")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1182890582")
    }
    create("taregh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.taregh"
        resValue(type = "string", name = "app_name", value = "سورة الطارق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5485097673")
    }
    create("ala") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ala"
        resValue(type = "string", name = "app_name", value = "سورة الأعلى")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7008371830")
    }
    create("qashie") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.qashie"
        resValue(type = "string", name = "app_name", value = "سورة الغاشية")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8441707150")
    }
    create("fajr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fajr"
        resValue(type = "string", name = "app_name", value = "سورة الفجر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3632233603")
    }
    create("balad") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.balad"
        resValue(type = "string", name = "app_name", value = "سورة البلد")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6003972429")
    }
    create("shams") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.shams"
        resValue(type = "string", name = "app_name", value = "سورة الشمس")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1576915900")
    }
    create("layl") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.layl"
        resValue(type = "string", name = "app_name", value = "سورة الليل")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6933184364")
    }
    create("zoha") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.zoha"
        resValue(type = "string", name = "app_name", value = "سورة الضحى")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2614665403")
    }
    create("sharh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.sharh"
        resValue(type = "string", name = "app_name", value = "سورة الشرح")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1002200837")
    }
    create("tin") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.tin"
        resValue(type = "string", name = "app_name", value = "سورة التين")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3345293147")
    }
    create("alaq") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.alaq"
        resValue(type = "string", name = "app_name", value = "سورة العلق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7720378772")
    }
    create("qadr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.qadr"
        resValue(type = "string", name = "app_name", value = "سورة القدر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3342150069")
    }
    create("bayyina") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.bayyina"
        resValue(type = "string", name = "app_name", value = "سورة البينة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3153721456")
    }
    create("zalzalah") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.zalzalah"
        resValue(type = "string", name = "app_name", value = "سورة الزلزلة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4857685362")
    }
    create("adiyat") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.adiyat"
        resValue(type = "string", name = "app_name", value = "سورة العاديات")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3924603997")
    }
    create("qariah") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.qariah"
        resValue(type = "string", name = "app_name", value = "سورة القارعة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5585170026")
    }
    create("takathur") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.takathur"
        resValue(type = "string", name = "app_name", value = "سورة التكاثر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9091625603")
    }
    create("asr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.asr"
        resValue(type = "string", name = "app_name", value = "سورة العصر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3839298924")
    }
    create("humazah") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.humazah"
        resValue(type = "string", name = "app_name", value = "سورة الهمزة")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6166897601")
    }
    create("fil") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.fil"
        resValue(type = "string", name = "app_name", value = "سورة الفيل")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2227652595")
    }
    create("quraysh") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.quraysh"
        resValue(type = "string", name = "app_name", value = "سورة قريش")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3999081029")
    }
    create("maun") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.maun"
        resValue(type = "string", name = "app_name", value = "سورة الماعون")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3397990386")
    }
    create("kawthar") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.kawthar"
        resValue(type = "string", name = "app_name", value = "سورة الكوثر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1372917686")
    }
    create("kafirun") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.kafirun"
        resValue(type = "string", name = "app_name", value = "سورة الكافرون")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6515108316")
    }
    create("nasr") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nasr"
        resValue(type = "string", name = "app_name", value = "سورة النصر")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2575863306")
    }
    create("masad") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.masad"
        resValue(type = "string", name = "app_name", value = "سورة المسد")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4577665526")
    }
    create("ikhlas") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.ikhlas"
        resValue(type = "string", name = "app_name", value = "سورة الإخلاص")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1169737706")
    }
    create("falaq") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.falaq"
        resValue(type = "string", name = "app_name", value = "سورة الفلق")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1963944623")
    }
    create("nas") {
        dimension = "flavor-type"
        applicationId = "org.meraaj.nas"
        resValue(type = "string", name = "app_name", value = "سورة الناس")
        resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2291247687")
    }
}
}