//
//  ExtendedDot.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ExtendedDotDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0 ... numberOfPages {
            if i != Int(currentItem + 1), i != Int(currentItem) {
                var newX: CGFloat = 0
                var newY: CGFloat = 0
                var newHeight: CGFloat = 0
                var newWidth: CGFloat = 0
            
                let dotColor = indicatorColor
                
                let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                let y = rect.origin.y + centeredYPosition
                var x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                
                if i != Int(currentItem + 2) {
                    x -= 2
                }
                else {
                    x -= width / 2
                }

                newHeight = size
                newWidth = width
                newX = rect.origin.x + x
                newY = y

                drawItem(CGRect(x: newX, y: newY, width: newWidth, height: newHeight), raduis: radius,
                         color: dotColor,
                         borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }

    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let color = dotsColor
        if currentItem >= 0 {
            let step: CGFloat = width
            let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
            let y = rect.origin.y + centeredYPosition
            let currPosProgress = currentItem - floor(currentItem)
            let steadyPosition = floor(currentItem)
            
            let x = getCenteredXPosition(rect,
                                         itemPos: steadyPosition,
                                         dotSize: width,
                                         space: space,
                                         numberOfPages: numberOfPages + 1)
            
            let halfMovementRatio = 2 - currPosProgress
            let desiredWidth = width + (halfMovementRatio * step)
            let desiredX = rect.origin.x + x
            let rect = CGRect(x: desiredX,
                              y: y,
                              width: width * 2,
                              height: size)
            
            drawItem(rect,
                     raduis: radius,
                     color: color,
                     borderWidth: borderWidth,
                     borderColor: borderColor)
        }
    }
}
