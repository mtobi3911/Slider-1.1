/*import UIKit

protocol SquareaAreaProtocol {
    init(size: CGSize, color: UIColor)
    // установить шарики в область
    func setBalls(withColors: [UIColor], andRadius: Int)
}

public class SquareArea: UIView, SquareaAreaProtocol {
    required public init(size: CGSize, color: UIColor) {
        // создание обработчика столкновений
         collisionBehavior = UICollisionBehavior(items: [])
         // строим прямоугольную графическую область
         super.init(frame:
         CGRect(x: 0, y: 0, width: size.width, height: size.height))
         // изменяем цвет фона
         self.backgroundColor = color
         // указываем границы прямоугольной области
         // как объекты взаимодействия
         // чтобы об них могли ударяться шарики
         collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(
         with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
         // подключаем аниматор с указанием на сам класс
         animator = UIDynamicAnimator(referenceView: self)
         // подключаем к аниматору обработчик столкновений
         animator?.addBehavior(collisionBehavior)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setBalls(withColors: [UIColor], andRadius: Int) {
        for (index, oneBallColor) in ballsColor.enumerated() {
         // рассчитываем координаты левого верхнего угла шарика
         let coordinateX = 10 + (2 * radius) * index
         let coordinateY = 10 + (2 * radius) * index
         // создаем экземпляр сущности "Шарик"
         let ball = Ball(color: oneBallColor, radius: radius, coordinates: (x: coordinateX, y: coordinateY))
         // добавляем шарик в текущее отображение (в состав прямоугольной
         // площадки)
         self.addSubview(ball)
         // добавляем шарик в коллекцию шариков
         self.balls.append(ball)
         // добавляем шарик в обработчик столкновений
         collisionBehavior.addItem(ball)
        }
    }
    
    // коллекции всех шаров
    private var balls: [Ball] = []
    private var animator: UIDynamicAnimator?
    private var SnapBehavior: UISnapBehavior?
    private var collisionBehavior: UICollisionBehavior
}

public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
            let touchLocation = touch.location( in: self )
            for ball in balls {
                    if (ball.frame.contains( touchLocation )) {
                        snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                        snapBehavior?.damping = 0.5
                        animator?.addBehavior(snapBehavior!)
                    }
            }
    }
}

public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
        let touchLocation = touch.location( in: self )
        if let snapBehavior = snapBehavior {
            snapBehavior.snapPoint = touchLocation
        }
    }
}

public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let snapBehavior = snapBehavior {
        animator?.removeBehavior(snapBehavior)
    }
    snapBehavior = nil
}
*/



import UIKit

// Протокол, описывающий функционал области
protocol SquareAreaProtocol {
    init(size: CGSize, color: UIColor)
    func setBalls(withColors: [UIColor], andRadius: Int)
}

public class SquareArea: UIView, SquareAreaProtocol {
    // Создание обработчика столкновений
    private var collisionBehavior: UICollisionBehavior
    // Аниматор
    private var animator: UIDynamicAnimator?
    // Обработчик перетаскивания
    private var snapBehavior: UISnapBehavior?

    // Инициализатор области
    required public init(size: CGSize, color: UIColor) {
        collisionBehavior = UICollisionBehavior(items: [])
        super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.backgroundColor = color
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        animator = UIDynamicAnimator(referenceView: self)
        animator?.addBehavior(collisionBehavior)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Метод для добавления шариков в область
    public func setBalls(withColors: [UIColor], andRadius: Int) {
        var balls: [vall] = [] // Коллекция всех шаров
        let radius = CGFloat(andRadius)
        for (index, oneBallColor) in withColors.enumerated() {
            let coordinateX = 8 + (2 * radius) * CGFloat(index)
            let coordinateY = 8 + (2 * radius) * CGFloat(index)
            let ball = vall(color: oneBallColor, radius: CGFloat(Int(radius)), coordinates: (x: coordinateX, y: coordinateY))
            self.addSubview(ball)
            balls.append(ball)
            collisionBehavior.addItem(ball)
        }
    }

    // Обработка касаний
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        for view in self.subviews {
            if let ball = view as? vall, ball.frame.contains(touchLocation) {
                snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                snapBehavior?.damping = 0.3
                animator?.addBehavior(snapBehavior!)
            }
        }
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let snapBehavior = snapBehavior else { return }
        let touchLocation = touch.location(in: self)
        snapBehavior.snapPoint = touchLocation
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }
}

// Пример класса Ball, чтобы код компилировался
class vall: UIView {
    init(color: UIColor, radius: CGFloat, coordinates: (x: CGFloat, y: CGFloat)) {
        super.init(frame: CGRect(x: coordinates.x, y: coordinates.y, width: radius, height: radius))
        self.backgroundColor = color
        self.layer.cornerRadius = radius / 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


