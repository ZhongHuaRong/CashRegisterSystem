import Qt.labs.settings 1.0

Settings {
    id:setting
    
    enum SortBy {
        Default,
        SevenASC,
        SevenDES
    }
    
    enum IconSize {
        Small,
        Medium,
        Large
    }
    
    enum Decimal {
        None,
        RemoveFen,
        RemoveJiao
    }
    
    enum DecimalRules{
        Rounding,
        Remove
    }
    
    property string account: ""
    property string shop_name: ""
    property string account_name: ""
    property int ads_pic_index: 0
    property string billing_ad: "请出示支付宝或微信二维码，扫码后付款"
    property string billing_finsh_ad: "感谢惠顾,请留意消费短信并查看明细"
    property string greeting: "感谢您的惠顾,请看客显上的会员信息"
    property int shop_sort: GlobalSettings.SortBy.Default
    property int icon_size: GlobalSettings.IconSize.Small
    property int remove_decimal: GlobalSettings.Decimal.None
    property int remove_decimal_rule: GlobalSettings.DecimalRules.Rounding
    property int receipt_font_size_index: 0
    property int label_font_size_index: 0
    property bool alipay: true
    property bool wxpay: true
    property bool membership_card: true
    property string font_family: "微软雅黑"
    property int font_pixel: 12
    property string image_path: "./image/"
}
