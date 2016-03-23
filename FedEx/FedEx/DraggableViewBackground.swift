//
//  DraggableViewBackground.swift
//  WillYou
//
//  Created by Lucas Andrade on 2/14/16.
//  Copyright © 2016 LucasAndradeRibeiro. All rights reserved.
//

import UIKit

import Foundation
import UIKit

class DraggableViewBackground: UIView, DraggableViewDelegate {
    var exampleCardLabels: [String]!
    var namePictures: [String]! = ["1"]

    var allCards: [DraggableView]!
    
    let MAX_BUFFER_SIZE = 2
    let CARD_HEIGHT: CGFloat = 435
    let CARD_WIDTH: CGFloat = 290
    
    var cardsLoadedIndex: Int!
    var loadedCards: [DraggableView]!
    var menuButton: UIButton!
    var messageButton: UIButton!
    var checkButton: UIButton!
    var xButton: UIButton!
    var labelStart: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        exampleCardLabels = ["first", "second", "third", "fourth", "last","test"]
        for var count = 2; count<23; ++count{
            namePictures.append("\(count)")
        }
        namePictures.append("propose")
        
        allCards = []
        loadedCards = []
        cardsLoadedIndex = 0
        self.loadCards()
        self.setupView()
    }
    
    func setupView() -> Void {
        self.backgroundColor = UIColor.whiteColor()
        
        let iconImage = UIImageView(image: UIImage(named: "fedex_logo_orange"))
        iconImage.frame = CGRectMake(60,40,200,87)
        
        
        
        self.addSubview(iconImage)

    }
    
    func createDraggableViewWithDataAtIndex(index: NSInteger) -> DraggableView {
        let draggableView = DraggableView(frame: CGRectMake((self.frame.size.width - CARD_WIDTH)/2, 120, CARD_WIDTH, CARD_HEIGHT), pictureName: namePictures[index])
        
        draggableView.delegate = self
        
        xButton = UIButton(frame: CGRectMake(25, 330, 70, 70))
        xButton.setImage(UIImage(named: "purple_check"), forState: UIControlState.Normal)
        xButton.addTarget(self, action: "swipeLeft", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        if index == 0{
            
            
            
        }
        else if index == 1{
            
            checkButton = UIButton(frame: CGRectMake(200, 330, 65, 65))
            checkButton.setImage(UIImage(named: "play_orange"), forState: UIControlState.Normal)
            checkButton.addTarget(self, action: "swipeRight", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            labelStart = UILabel(frame: CGRectMake(155, 365, 160,100))
            labelStart.text = "Start Automatic Completion"
            labelStart.font = UIFont(name: "Futura-CondensedExtraBold", size: 15)
            labelStart.textColor = UIColor(red: 241/255, green: 99/255, blue: 3/255, alpha: 1)
            labelStart.numberOfLines = 2
            labelStart.textAlignment = .Center
            
            let labelNameTask = UILabel(frame: CGRectMake(0,0, 300, 50))
            labelNameTask.text = "Pick up Package "
            labelNameTask.font = UIFont(name: "Futura-CondensedExtraBold", size: 24)
            labelNameTask.textColor = UIColor.blackColor()
            labelNameTask.numberOfLines = 2
            labelNameTask.textAlignment = .Center
            
            let currentMileageField = UITextField(frame: CGRectMake(10, 100, 100, 35))
            currentMileageField.backgroundColor = UIColor.whiteColor()
            let labelMileage = UILabel(frame:  CGRectMake(2, 135, 300, 35))
            labelMileage.text = "*Current Mileage"
            labelMileage.font = UIFont(name: "Futura-CondensedExtraBold", size: 15)
            labelMileage.textColor = UIColor(red: 100/255, green: 0/255, blue: 190/55, alpha: 1)
            
            let labelArrivalMileage = UILabel(frame: CGRectMake(195, 105, 100, 35))
            labelArrivalMileage.text = "0 miles"
            labelArrivalMileage.font = UIFont(name: "Futura-CondensedExtraBold", size: 22)
            labelArrivalMileage.textColor = UIColor(red: 241/255, green: 99/255, blue: 3/255, alpha: 1)
            let labelArrivalMileageStatic = UILabel(frame: CGRectMake(175, 135, 300, 35))
            labelArrivalMileageStatic.text = "Arrival Mileage"
            labelArrivalMileageStatic.font = UIFont(name: "Futura-CondensedExtraBold", size: 15)
            labelArrivalMileageStatic.textColor = UIColor(red: 100/255, green: 0/255, blue: 190/55, alpha: 1)
            
            let labelCurrentTimeDynamic = UILabel(frame:CGRectMake(20, 205, 300, 35))
            labelCurrentTimeDynamic.text = "2:01 pm"
            labelCurrentTimeDynamic.font = UIFont(name: "Futura-CondensedExtraBold", size: 22)
            labelCurrentTimeDynamic.textColor = UIColor(red: 241/255, green: 99/255, blue: 3/255, alpha: 1)
            let labelCurrentTimeStatic = UILabel(frame: CGRectMake(17, 235, 300, 35))
            labelCurrentTimeStatic.text = "Current Time"
            labelCurrentTimeStatic.font =  UIFont(name: "Futura-CondensedExtraBold", size: 15)
            labelCurrentTimeStatic.textColor = UIColor(red: 100/255, green: 0/255, blue: 190/55, alpha: 1)
            
            let labelArrivalTimeDynamic = UILabel(frame: CGRectMake(190, 205, 300, 35))
            labelArrivalTimeDynamic.text = "2:24 pm"
            labelArrivalTimeDynamic.font = UIFont(name: "Futura-CondensedExtraBold", size: 22)
            labelArrivalTimeDynamic.textColor = UIColor(red: 241/255, green: 99/255, blue: 3/255, alpha: 1)
            let labelArrivalTimeStatic = UILabel(frame: CGRectMake(190, 235, 300, 35))
            labelArrivalTimeStatic.text = "Arrival Time"
            labelArrivalTimeStatic.font = UIFont(name: "Futura-CondensedExtraBold", size: 15)
            labelArrivalTimeStatic.textColor = UIColor(red: 100/255, green: 0/255, blue: 190/55, alpha: 1)

            
            draggableView.addSubview(labelNameTask)
            draggableView.addSubview(labelArrivalTimeStatic)
            draggableView.addSubview(labelArrivalTimeDynamic)
            draggableView.addSubview(labelCurrentTimeStatic)
            draggableView.addSubview(labelCurrentTimeDynamic)
            draggableView.addSubview(labelArrivalMileageStatic)
            draggableView.addSubview(labelArrivalMileage)
            draggableView.addSubview(labelMileage)
            draggableView.addSubview(currentMileageField)
            draggableView.addSubview(labelStart)
            draggableView.addSubview(checkButton)

        }
        let labelAlreadyDone = UILabel(frame: CGRectMake(5, 360, 100,100))
        labelAlreadyDone.text = "Task Done"
        labelAlreadyDone.font = UIFont(name: "Futura-CondensedExtraBold", size: 22)
        labelAlreadyDone.textColor = UIColor(red: 100/255, green: 0/255, blue: 190/55, alpha: 1)
    
        
        draggableView.addSubview(labelAlreadyDone)
        draggableView.addSubview(xButton)

        return draggableView
    }
    
    func loadCards() -> Void {
        if namePictures?.count > 0 {
            let num = namePictures.count > MAX_BUFFER_SIZE ? MAX_BUFFER_SIZE : namePictures.count
            for var i = 0; i < namePictures.count; i++ {
                let newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
                allCards.append(newCard)
                if i < num {
                    loadedCards.append(newCard)
                }
            }
            
            for var i = 0; i < loadedCards.count; i++ {
                if i > 0 {
                    self.insertSubview(loadedCards[i], belowSubview: loadedCards[i - 1])
                } else {
                    self.addSubview(loadedCards[i])
                }
                cardsLoadedIndex = cardsLoadedIndex + 1
            }
        }
    }
    
    func cardSwipedLeft(card: UIView) -> Void {
        loadedCards.removeAtIndex(0)
        
        if cardsLoadedIndex < allCards.count {
            loadedCards.append(allCards[cardsLoadedIndex])
            cardsLoadedIndex = cardsLoadedIndex + 1
            self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
        }
    }
    
    func cardSwipedRight(card: UIView) -> Void {
        loadedCards.removeAtIndex(0)
        
        if cardsLoadedIndex < allCards.count {
            loadedCards.append(allCards[cardsLoadedIndex])
            cardsLoadedIndex = cardsLoadedIndex + 1
            self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
        }
    }
    
    func swipeRight() -> Void {
//        if loadedCards.count <= 0 {
//            return
//        }
//        let dragView: DraggableView = loadedCards[0]
//        dragView.overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeRight)
//        UIView.animateWithDuration(0.2, animations: {
//            () -> Void in
//            dragView.overlayView.alpha = 1
//        })
//        dragView.rightClickAction()
        
        print("right")
        let buttonDone = UIButton(frame: CGRectMake(200, 330, 65, 65))
        buttonDone.addTarget(self, action: "doneButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonDone.setTitle("Done", forState: .Normal)
        buttonDone.setTitleColor(UIColor(red: 241/255, green: 99/255, blue: 3/255, alpha: 1), forState: .Normal)
        buttonDone.titleLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 28)
        
        loadedCards[0].addSubview(buttonDone)
        
        checkButton.hidden = true
        labelStart.hidden = true
    }
    
    func swipeLeft() -> Void {
//        if loadedCards.count <= 0 {
//            return
//        }
//        let dragView: DraggableView = loadedCards[0]
//        dragView.overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeLeft)
//        UIView.animateWithDuration(0.2, animations: {
//            () -> Void in
//            dragView.overlayView.alpha = 1
//        })
//        dragView.leftClickAction()
        if loadedCards.count <= 0 {
            return
        }
        let dragView: DraggableView = loadedCards[0]
        dragView.overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeRight)
        UIView.animateWithDuration(0.2, animations: {
            () -> Void in
            dragView.overlayView.alpha = 1
        })
        dragView.rightClickAction()

    }
    func doneButtonAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("reviewTaskVC") as! ReviewTaskViewController
        vc.numberOfTask = 0
        self.addSubview(vc.view)
    }
}
