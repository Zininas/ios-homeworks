//
//  Post.swift
//  Navigation
//
//  Created by Александр Зинин on 20.05.2022.
//

import UIKit

struct PostModel {
    var author: String
    var description: String?
    var image: String
    var likes: Int
    var views: Int
    
    static func makeMockModel() -> [PostModel] {
        var model = [PostModel]()
   
        model.append(PostModel(author: "Николай II (1868–1918) - последний российский император.", description: "Николай II (1868–1918) - последний российский император, сын Александра III и Марии Федоровны. Вступил на престол в 1894 году и в первом же публичном выступлении в ответ на слухи об ожидаемой либерализации заявил: «Пусть же все знают, что я, посвящая все силы благу народному, буду охранять начало самодержавия так же твердо и неуклонно, как охранял его мой незабвенный покойный родитель». Царствование Николая II ознаменовалось быстрым экономическим развитием страны, расцветом культурной жизни, началом осуществления столыпинской аграрной реформы и учреждением Государственной думы. Однако поражение в русско-японской войне и обострение социальных противоречий привело к первой русской революции 1905 года, а участие в составе Антанты в мировой империалистической войне закончилось Февралем 1917 года и отречением царя от престола. После Октябрьской революции был расстрелян вместе с семьей в Екатеринбурге. Сбылось пророчество выдающегося русского историка В. О. Ключевского и предвидение Ф. Энгельса, утверждавших, что наследнику трона цесаревичу Алексею не суждено царствовать. Русской православной церковью Николай II, его жена и пятеро детей причислены к лику мучеников, канонизированы и в настоящий момент почитаются как «Царственные страстотерпцы».", image: "Николай II", likes: 1917, views: 951945))
        model.append(PostModel(author: "Торжественное заседание Государственного совета 7 мая 1901 года, в день столетнего юбилея со дня его учреждения.", description: "Все члены учрежденного Александром I Государственного совета присутствуют в Круглом зале Мариинского дворца. На центральном месте Николай II и представители императорского дома, занимающие важнейшие посты в государстве. Справа от царя — его младший брат, в то время наследник престола цесаревич Михаил, слева — великий князь Михаил Николаевич (брат Александра II). Поблизости от царской семьи — председатель Комитета министров И. Н. Дурново, министр иностранных дел В. Н. Ламздорф, оберпрокурор Святейшего Синода К. П. Победоносцев и другие. Всего на портрете изображен восемьдесят один член Совета, среди них С. Ю. Витте, П. П. Семенов-Тян-Шанский и др.", image: "Николай II", likes: 1898, views: 220641))
        model.append(PostModel(author: "17 октября 1905 года.", description: "К началу XX века Российская империя представляла собой абсолютную монархию и входила в число пяти крупнейших промышленных держав мира. Однако почти все слои русского общества были недовольны своим положением: буржуазия и интеллигенция желали конституции и гражданских свобод, крестьяне — помещичьей земли, рабочие — достойных условий труда и повышения заработной платы. Последней каплей стало поражение в русско-японской войне. 9 января 1905 года к Зимнему дворцу в Петербурге с петицией направились тысячи демонстрантов во главе с лидером профсоюзного движения священником Георгием Гапоном, которые были расстреляны войсками. «Кровавое воскресенье» положило начало волнениям, переросшим к осени во Всероссийскую политическую стачку. Это вынудило Николая II издать 17/30 октября Манифест, которым были дарованы гражданские права и свободы, а также учрежден парламент — Государственная дума с законодательными функциями. Вскоре началась столыпинская земельная реформа. Страна вступила в новую фазу своего политического развития.", image: "Николай II", likes: 1703, views: 951945))
        model.append(PostModel(author: "17 октября 1905 года.", description: "К началу XX века Российская империя представляла собой абсолютную монархию и входила в число пяти крупнейших промышленных держав мира. Однако почти все слои русского общества были недовольны своим положением: буржуазия и интеллигенция желали конституции и гражданских свобод, крестьяне — помещичьей земли, рабочие — достойных условий труда и повышения заработной платы. Последней каплей стало поражение в русско-японской войне. 9 января 1905 года к Зимнему дворцу в Петербурге с петицией направились тысячи демонстрантов во главе с лидером профсоюзного движения священником Георгием Гапоном, которые были расстреляны войсками. «Кровавое воскресенье» положило начало волнениям, переросшим к осени во Всероссийскую политическую стачку. Это вынудило Николая II издать 17/30 октября Манифест, которым были дарованы гражданские права и свободы, а также учрежден парламент — Государственная дума с законодательными функциями. Вскоре началась столыпинская земельная реформа. Страна вступила в новую фазу своего политического развития.", image: "Николай II", likes: 1898, views: 220641))
    
        return model
    }
}
