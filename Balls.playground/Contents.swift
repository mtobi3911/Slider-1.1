import PlaygroundSupport
import UIKit

// размеры прямоугольной области
let sizeOfArea = CGSize(width: 400, height: 400)
// создание экземпляра
var area = SquareArea(size: sizeOfArea, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

area.setBalls(withColors: [#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)], andRadius: 60)

// установка экземпляра в качестве текущего отображения
PlaygroundPage.current.liveView = area
