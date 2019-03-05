SizeType.create!(
  [
    {
      size_type: "洋服",
    },

    {
      size_type: "靴",
    }
  ]
)



Size.create!(
  [
    {
      name: "XXS以下",
      size_type_id: 1,
    },
    {
      name: "XS(SS)",
      size_type_id: 1,
    },
    {
      name: "S",
      size_type_id: 1,
    },
    {
      name: "M",
      size_type_id: 1,
    },
    {
      name: "L",
      size_type_id: 1,
    },
    {
      name: "XL(LL)",
      size_type_id: 1,
    },
    {
      name: "2XL(3L)",
      size_type_id: 1,
    },
    {
      name: "3XL(4L)",
      size_type_id: 1,
    },
    {
      name: "4XL(5L)以上",
      size_type_id: 1,
    },
    {
      name: "FREE SIZE",
      size_type_id: 1,
    },
    {
      name: "20cm以下",
      size_type_id: 2,
    },
    {
      name: "20.5cm",
      size_type_id: 2,
    },
    {
      name: "21cm",
      size_type_id: 2,
    },
    {
      name: "21.5cm",
      size_type_id: 2,
    },
    {
      name: "22cm",
      size_type_id: 2,
    },
    {
      name: "22.5cm",
      size_type_id: 2,
    },
    {
      name: "23cm",
      size_type_id: 2,
    },
    {
      name: "23.5cm",
      size_type_id: 2,
    },
    {
      name: "24cm",
      size_type_id: 2,
    },
    {
      name: "24.5cm",
      size_type_id: 2,
    },
    {
      name: "25cm",
      size_type_id: 2,
    },
    {
      name: "25.5cm",
      size_type_id: 2,
    },
    {
      name: "26cm",
      size_type_id: 2,
    },
    {
      name: "26.5cm",
      size_type_id: 2,
    },
    {
      name: "27cm",
      size_type_id: 2,
    },
    {
      name: "27.5cm以上",
      size_type_id: 2,
    },
  ]
)
UpperCategory.create!(
  [
    {
      name: 'レディース',
    },
    {
      name: 'メンズ',
    },
    {
      name: 'ベビー・キッズ',
    },
    {
      name: 'インテリア・住まい・小物',
    },
    {
      name: '本・音楽・ゲーム',
    },
    {
      name: 'おもちゃ・ホビー・グッズ',
    },
    {
      name: 'コスメ・香水・美容',
    },
    {
      name: '家電・スマホ・カメラ',
    },
    {
      name: 'スポーツ・レジャー',
    },
    {
      name: 'ハンドメイド',
    },
    {
      name: 'チケット',
    },
    {
      name: '自動車・オートバイ',
    },
    {
      name: 'その他',
    },
  ]
)
MiddleCategory.create!(
  [
    {
      name: 'トップス',
      upper_category_id: 1,
      size_type_id: 1,
    },
    {
      name: 'ジャケット',
      upper_category_id: 1,
      size_type_id: 1,
    },
    {
      name: 'パンツ',
      upper_category_id: 1,
      size_type_id: 1,
    },
    {
      name: 'トップス',
      upper_category_id: 2,
      size_type_id: 1,
    },
    {
      name: 'ジャケット/アウター',
      upper_category_id: 2,
      size_type_id: 1,
    },
    {
      name: 'パンツ',
      upper_category_id: 2,
      size_type_id: 1,
    },
    {
      name: 'ベビー服(女の子用)',
      upper_category_id: 3,
      size_type_id: 1,
    },
    {
      name: 'ベビー服(男の子用)',
      upper_category_id: 3,
      size_type_id: 1,
    },
    {
      name: 'ベビー服(男女兼用)',
      upper_category_id: 3,
      size_type_id: 1,
    },
    {
      name: 'キッチン/食器',
      upper_category_id: 4,
      size_type_id: 1,
    },
    {
      name: 'ベット/マットレス',
      upper_category_id: 4,
      size_type_id: 1,
    },
    {
      name: 'ソファ/ソファベッド',
      upper_category_id: 4,
      size_type_id: 1,
    },
    {
      name: '本',
      upper_category_id: 5,
      size_type_id: 1,
    },
    {
      name: '漫画',
      upper_category_id: 5,
      size_type_id: 1,
    },
    {
      name: 'おもちゃ',
      upper_category_id: 6,
      size_type_id: 1,
    },
    {
      name: 'タレントグッズ',
      upper_category_id: 6,
      size_type_id: 1,
    },
  ]
)
DeliveryBurden.create! (
  [
    {
      name: '送料込み(出品者負担)',
    },
    {
      name: '着払い(購入者負担)',
    },
  ]
)

DeliveryDate.create! (
  [
    {
      name: '1~2日で発送',
    },
    {
      name: '2~3日で発送',
    },
    {
      name: '4~7日で発送',
    },
  ]
)
DeliveryMethod.create! (
  [
    {
      name: '未定',
    },
    {
      name: 'らくらくメルカリ便',
    },
    {
      name: 'ゆうメール',
    },
    {
      name: 'レターパック',
    },
    {
      name: '普通郵便(定形, 定形外)',
    },
    {
      name: 'クロネコヤマト',
    },
    {
      name: 'ゆうパック',
    },
    {
      name: 'クリックポスト',
    },
  ]
)
Brand.create! (
  [
    {
      name: 'アーカー',
    },
    {
      name: 'アーキ',
    },
    {
      name: 'イーエム',
    },
    {
      name: 'イージースピリット',
    },
    {
      name: 'ヴァーガス',
    },
    {
      name: 'ヴァージニア',
    },
    {
      name: '179ダブリュジー',
    },
    {
      name: '1975トーキョー',
    },
    {
      name: '三愛水着学園',
    },
  ]
)
LowerCategory.create!(
  [
    {
      name: 'Tシャツ/カットソー(半袖/袖なし)',
      middle_category_id: 1,
    },
    {
      name: 'Tシャツ/カットソー(７分/長袖)',
      middle_category_id: 1,
    },
    {
      name: 'テーラードジャケット',
      middle_category_id: 2,
    },
    {
      name: 'ノーカラージャケット',
      middle_category_id: 2,
    },
  ]
)

Condition.create!(
  [
    {
      name: '販売中',
    },
    {
      name: '売り切れ',
    }
  ]
)

Status.create!(
  [
    {
      name: '新品、未使用',
    },
    {
      name: '未使用に近い',
    },
    {
      name: '目立った傷や汚れなし',
    },
    {
      name: 'やや傷や汚れあり',
    },
    {
      name: '傷や汚れあり',
    },
    {
      name: '全体的に状態が悪い',
    }
  ]
)
