//
//  VCIMobile
//
//  Created by Thien Vu on 20/08/2022.
//

import Foundation

final public class GlobalThemePicker: Sendable {
    
    // MARK: - Common
    public static var whiteColor: ThemeColorPicker {"common.white"}
    public static var blackColor: ThemeColorPicker {"common.black"}
    public static var greenColor : ThemeColorPicker {"common.green"}
    public static var redColor : ThemeColorPicker {"common.red"}
    public static var dominantColor: ThemeColorPicker {"common.dominant"}
    public static var gray1Color: ThemeColorPicker {"common.gray1"}
    public static var gray2Color: ThemeColorPicker {"common.gray2"}
    public static var gray3Color: ThemeColorPicker {"common.gray3"}
    public static var gray4Color: ThemeColorPicker {"common.gray4"}
    public static var gray5Color: ThemeColorPicker {"common.gray5"}
    public static var gray6Color: ThemeColorPicker {"common.gray6"}
    
    // MARK: - Button
    public static var deactiveButtonColor: ThemeColorPicker {"button.deactive"}
    public static var deactiveContentButton: ThemeColorPicker {"button.deactiveContent"}
}
